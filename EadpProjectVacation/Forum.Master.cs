using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EadpProjectVacation
{
    public partial class Forum : System.Web.UI.MasterPage
    {

        private Random randId = new Random();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        
        //protected void BtnSubmit_Click(object sender, EventArgs e)
        //{
        //    if(inputTitle.Text == null){
        //        labelVerification.Text = "Please enter a topic!";
        //        labelVerification.ForeColor = Color.Red;
        //    }
        //}

        private String UploadImage()
        {
            string imgName = FileUploadImage.FileName;
            string imgPath = "images/" + imgName;
            int imgSize = FileUploadImage.PostedFile.ContentLength;
            if(FileUploadImage.PostedFile != null && FileUploadImage.PostedFile.FileName != "")
            {
                FileUploadImage.SaveAs(Server.MapPath(imgPath));
                imgPicture.ImageUrl = "~/" + imgPath;
                return imgPath;
            }
            return String.Empty;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            String imgPath = UploadImage();

            string DBConnect = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            SqlConnection myConn = new SqlConnection(DBConnect);
            myConn.Open();

            string sqlStmt = "Insert INTO Forum (ForumId, ForumTitle, ForumDescription,ForumImagePath)"
                                 +
                             "VALUES (@id, @title,@description,@imgPath)"; 
                                    
            int result = 0; //Executee NonQuery return an integer value
            SqlCommand sqlCmd = new SqlCommand(sqlStmt, myConn);

            sqlCmd.Parameters.AddWithValue("id", randId.Next());
            sqlCmd.Parameters.AddWithValue("title", inputTitle.Value);
            sqlCmd.Parameters.AddWithValue("description", textareaMsg.InnerText);
            sqlCmd.Parameters.AddWithValue("imgPath", imgPath);
            result = sqlCmd.ExecuteNonQuery();
            System.Diagnostics.Debug.WriteLine("------- TESTING ------. Result is: " + result);

            Response.Redirect("ForumMainPage.aspx");
        }
    }
}