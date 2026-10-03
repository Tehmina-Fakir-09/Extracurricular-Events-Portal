using System;
using System.Net.Mail;
using System.Web.UI;
using System.Data.SqlClient;
public partial class Student_Payment : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Extracurricular Events Portal\App_Data\EEP.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string eventName = Request.QueryString["EventName"] ?? "Unknown Event";
            string paymentMethod = Request.QueryString["PaymentMethod"] ?? "Cash";
            string username = Session["student"].ToString();
            string studentEmail = lblemail.Text;
            cn.Open();
            cmd.CommandText = "select Email from AdminStudents where username='" + username + "'";
            cmd.Connection = cn;
            studentEmail = cmd.ExecuteScalar().ToString();
            cn.Close();
            lblEventName.Text = eventName;
            lblPaymentMethod.Text = paymentMethod;
            lblemail.Text = studentEmail;

            // Save student email safely
            ViewState["StudentEmail"] = studentEmail;

            // ✅ Fetch event fee from ManageEvent table
            cn.Open();
            cmd = new SqlCommand("SELECT Fee FROM ManageEvent WHERE Eventname = @eventName", cn);
            cmd.Parameters.AddWithValue("@eventName", eventName);
            object feeValue = cmd.ExecuteScalar();
            cn.Close();

            if (feeValue != null && feeValue != DBNull.Value)
            {
                lblEventFee.Text = "₹ " + feeValue.ToString();
                ViewState["EventFee"] = feeValue.ToString();
            }
            else
            {
                lblEventFee.Text = "₹ 0";
                ViewState["EventFee"] = "0";
            }



            if (paymentMethod == "Online/UPI")
            {
                divOnline.Visible = true;
                divTransaction.Visible = true;
                
            }
      
}
    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        string eventName = lblEventName.Text;
        string paymentMethod = lblPaymentMethod.Text;
        string studentEmail = (ViewState["StudentEmail"] ?? "").ToString();

        if (string.IsNullOrEmpty(studentEmail))
        {
            Response.Write("<script>alert('Student email not found.'); window.location='Home.aspx';</script>");
            return;
        }

        string transactionID = "N/A"; // default for Cash

        if (paymentMethod == "Online/UPI")
        {
            if (txtTransactionID == null || string.IsNullOrEmpty(txtTransactionID.Text.Trim()))
            {
                Response.Write("<script>alert('Please enter the Transaction ID for UPI payment.');</script>");
                return;
            }
            transactionID = txtTransactionID.Text.Trim();
        }

        // TODO: Save payment info to database (EventName, StudentEmail, PaymentMethod, TransactionID)
        cn.Open();
        cmd.CommandText = "insert into Payment values('" + eventName + "','" + studentEmail + "','" + paymentMethod + "','" + transactionID + "')";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();

        // Send Email to student
        string body = string.Format(
    "Your registration for {0} is successful. Payment Method: {1}, Transaction ID: {2}",
    eventName, paymentMethod, transactionID
);
        SendEmail(studentEmail, "Event Registration Successful", body);

        Response.Write("<script>alert('Payment Confirmation will be sent via Email.'); window.location='BrowseEvents.aspx';</script>");
    }

    private void SendEmail(string toEmail, string subject, string body)
    {
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("shravanigoad@gmail.com"); // must match credentials
            mail.To.Add(toEmail);
            mail.Subject = subject;
            mail.Body = body;

            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("shravanigoad@gmail.com", "aibm ouar fklj eycq");
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
        catch (Exception ex)
        {
            // Log or show error
        }
    }

    private void SendSMS(string mobileNumber, string message)
    {
        // Placeholder: integrate with SMS API
    }
}
