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


public partial class Managesyllabus : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");
    string ftpurl = "ftp://182.50.132.7/StudFacC/Docs";
    string ftpname = "Hostoise";
    string ftppass = "Tyfo61*1";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Tid"] == null)
            {
                Response.Redirect("Tutorlogin.aspx");
            }
            string tutorid = Session["Tid"].ToString();
            string sql = "Select * from TDocuments where Type='Syllabus'  and Tid='" + tutorid + "'";
            SqlDataAdapter da1 = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            da1.Fill(ds);
            int i = ds.Tables[0].Rows.Count;
            if (i > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            string tid = Session["Tid"].ToString();
            string co = "Select Cname from Course where Cid IN (Select Cid from TutorSubjects where Tid = '" + tid + "')";
            SqlDataAdapter daa1 = new SqlDataAdapter(co, con);
            DataSet myDataSet = new DataSet();
            daa1.Fill(myDataSet, "Course");
            DropDownCourse.DataSource = myDataSet;
            DropDownCourse.DataBind();
            DropDownCourse.DataTextField = "Cname";
            DropDownCourse.DataValueField = "Cname";
            DropDownCourse.DataBind();
            DropDownCourse.Items.Insert(0, "--Select--");
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

    protected void btnadd_Click(object sender, EventArgs e)
    {
        string courseid = "";
        string subjectid = "";
        if (Session["Tid"] == null)
        {
            Response.Redirect("Tutorlogin.aspx");
        }
        string tid = Session["Tid"].ToString();
        if (txttitle.Text != "" && txtdesc.Text != "" && uploadSyllabus.FileName != "" && DropDownCourse.Text != "" && DropDownSubject.Text != "")
        {
            string selectcourseid = "Select Cid from Course where Cname='" + DropDownCourse.SelectedValue + "'";
            SqlCommand Cid = new SqlCommand(selectcourseid, con);
            con.Open();
            SqlDataReader dr = Cid.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                courseid = dr[0].ToString();
            }
            con.Close();
            string selectsubjectid = "Select Sbid from Subjects where Sname='" + DropDownSubject.SelectedValue + "'";
            SqlCommand Sid = new SqlCommand(selectsubjectid, con);
            con.Open();
            SqlDataReader drs = Sid.ExecuteReader();

            if (drs.HasRows)
            {
                drs.Read();
                subjectid = drs[0].ToString();
            }
            con.Close();
            int id;
            string filename = Path.GetFileName(uploadSyllabus.FileName);
            string path = Server.MapPath("~\\data\\");
            uploadSyllabus.SaveAs(Server.MapPath("~/data/" + filename));
                FileInfo fi = new FileInfo(uploadSyllabus.FileName);
                string extn = fi.Extension;
                string fname = fi.Name;
                if (extn == ".pdf" || extn == ".docx" || extn == ".doc" || extn == ".jpg" || extn == ".jpeg" || extn == ".png" || extn == ".txt")
                {
                    string imgstr = "~/data/" + filename.ToString();
                    DateTime date = DateTime.Now;
                    string dat = date.ToString("dd/MM/yyyy");
                    string time = date.ToString("hh:mm tt");


                string sel = "select top 1 Did from TDocuments order by Did desc";
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


                string ret = UploadFileToFTP(path + filename, filename, ftpurl + "/Syllabus/" + newfilename, ftpname, ftppass);


                string ins = "Insert into TDocuments (Title,Description,Docpath,Type,Date,Time,Tid,Cid,Sbid) values ('" + txttitle.Text + "','" + txtdesc.Text + "','" + newfilename + "','Syllabus','" + dat + "','" + time + "','"+tid+"','" + courseid + "','" + subjectid + "')";
                    SqlCommand cmd = new SqlCommand(ins, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Notice Added Susscessfully.')", true);
                    Response.Redirect("Managesyllabus.aspx");
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

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
           
            string fileName = e.CommandArgument.ToString();
            string up = " delete from TDocuments  where Docpath='" + fileName + "'";
            SqlCommand cmd = new SqlCommand(up, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftpurl + "/Syllabus/" + fileName);
            request.Method = WebRequestMethods.Ftp.DeleteFile;
            request.Credentials = new NetworkCredential(ftpname, ftppass);

            using (FtpWebResponse response = (FtpWebResponse)request.GetResponse())
            {
                string res = response.StatusDescription;
            }
            Response.Redirect("Managesyllabus.aspx");

        }
        else if (e.CommandName == "down")
        {
            //Response.Clear();
            //Response.ContentType = "appliation/octect-stream";
            //Response.AppendHeader("content-disposition", "filename =" + e.CommandArgument);
            //Response.TransmitFile(Server.MapPath("~/data/") + e.CommandArgument);
            //Response.End();


            string fileName = e.CommandArgument.ToString();


            try
            {
                //Create FTP Request.
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftpurl + "/Syllabus/" + fileName);
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

    protected void DropDownCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Session["Tid"] == null)
        {
            Response.Redirect("Tutorlogin.aspx");
        }
        string tid = Session["Tid"].ToString();
        if (DropDownSubject.SelectedValue != "--Select--")
        {
            panelsubject.Visible = true;
            string selectcmd = "Select Sname From Subjects where Sbid IN (Select Sbid from TutorSubjects where Cid IN(Select Cid from Course where Cname='" + DropDownCourse.SelectedValue + "') and sbid IN (Select Sbid from TutorSubjects where Tid='" + tid + "') and Tid = '"+tid+"') ";
            SqlDataAdapter daa1 = new SqlDataAdapter(selectcmd, con);
            DataSet myDataSet = new DataSet();
            daa1.Fill(myDataSet, "Subjects");
            DropDownSubject.DataSource = myDataSet;
            DropDownSubject.DataBind();
            DropDownSubject.DataTextField = "Sname";
            DropDownSubject.DataValueField = "Sname";
            DropDownSubject.DataBind();
            DropDownSubject.Items.Insert(0, "--Select--");

        }
    }
}