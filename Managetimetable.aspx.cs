using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.IO;
using System.Net;

public partial class Managetimetable : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");
    string ftpurl = "ftp://182.50.132.7/StudFacC/Docs";
    string ftpname = "Hostoise";
    string ftppass = "Tyfo61*1";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            string sql = "Select * from ADocuments where Type='TimeTable'";
            SqlDataAdapter da1 = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            da1.Fill(ds);
            int i = ds.Tables[0].Rows.Count;
            if (i > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
    }

    private static string UploadFileToFTP(string path, string name, string ftpurl, string ftpname, string pass)
    {
        //Save Uploaded File

        String source = path; //Saved File's Entire Path
        //String ftpurl = ftpurl;
        String ftpusername = ftpname; // FTP ID 
        String ftppassword = pass; // FTP PASS

        try
        {
            string filename = Path.GetFileName(source);
            string ftpfullpath = ftpurl;
            FtpWebRequest ftp = (FtpWebRequest)FtpWebRequest.Create(ftpfullpath);
            ftp.Credentials = new NetworkCredential(ftpusername, ftppassword);

            ftp.KeepAlive = true;
            ftp.UseBinary = true;
            ftp.Method = WebRequestMethods.Ftp.UploadFile;

            FileStream fs = File.OpenRead(source);
            byte[] buffer = new byte[fs.Length];
            fs.Read(buffer, 0, buffer.Length);
            fs.Close();

            Stream ftpstream = ftp.GetRequestStream();
            ftpstream.Write(buffer, 0, buffer.Length);
            ftpstream.Close();

            return "Success";
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "del")
        {
            string fileName = e.CommandArgument.ToString();
            string up = " delete from ADocuments  where Docpath='" + fileName + "'";
            SqlCommand cmd = new SqlCommand(up, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftpurl + "/TimeTable/" + fileName);
            request.Method = WebRequestMethods.Ftp.DeleteFile;
            request.Credentials = new NetworkCredential(ftpname, ftppass);

            using (FtpWebResponse response = (FtpWebResponse)request.GetResponse())
            {
                string res = response.StatusDescription;
            }
            Response.Redirect("Managetimetable.aspx");

        }
        else if (e.CommandName == "down")
        {
            string fileName = e.CommandArgument.ToString();


            try
            {
                //Create FTP Request.
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftpurl + "/TimeTable/" + fileName);
                request.Method = WebRequestMethods.Ftp.DownloadFile;

                //Enter FTP Server credentials.
                request.Credentials = new NetworkCredential(ftpname, ftppass);
                request.UsePassive = true;
                request.UseBinary = true;
                request.EnableSsl = false;

                //Fetch the Response and read it into a MemoryStream object.
                FtpWebResponse response = (FtpWebResponse)request.GetResponse();
                using (MemoryStream stream = new MemoryStream())
                {
                    //Download the File.
                    response.GetResponseStream().CopyTo(stream);
                    Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite(stream.ToArray());
                    Response.End();
                }
            }
            catch (WebException ex)
            {
                throw new Exception((ex.Response as FtpWebResponse).StatusDescription);
            }
        }
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        if (txttitle.Text != "" && txtdesc.Text != "" && uploadTimetable.FileName != "")
        {
            int id;
            string filename = Path.GetFileName(uploadTimetable.FileName);
            string path = Server.MapPath("~\\data\\");
            uploadTimetable.SaveAs(Server.MapPath("~/data/" + filename));
            FileInfo fi = new FileInfo(uploadTimetable.FileName);
            string extn = fi.Extension;
            string fname = fi.Name;
            if (extn == ".pdf" || extn == ".docx" || extn == ".doc" || extn == ".jpg" || extn == ".jpeg" || extn == ".png")
            {
                DateTime date = DateTime.Now;
                string dat = date.ToString("dd/MM/yyyy");
                string time = date.ToString("hh:mm tt");

                string sel = "select top 1 Did from ADocuments order by Did desc";
                SqlDataAdapter da = new SqlDataAdapter(sel, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                int i = ds.Tables[0].Rows.Count;
                if (i > 0)
                {
                    id = Convert.ToInt32(ds.Tables[0].Rows[0][0]) + 1;
                }
                else
                {
                    id = 101;
                }

                string newfilename = id + "_" + txttitle.Text + "_" + filename;


                string ret = UploadFileToFTP(path + filename, filename, ftpurl + "/TimeTable/" + newfilename, ftpname, ftppass);

                string ins = "Insert into ADocuments (Title,Description,Docpath,Type,Date,Time) values ('" + txttitle.Text + "','" + txtdesc.Text + "','" + newfilename + "','TimeTable','" + dat + "','" + time + "')";
                SqlCommand cmd = new SqlCommand(ins, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('TimeTable Added Susscessfully.')", true);
                Response.Redirect("Managetimetable.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Cannot upload File')", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Fill details')", true);
        }
    }
}