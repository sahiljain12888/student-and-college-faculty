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


public partial class DiscussionForum : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Tid"] == null)
            {
                Response.Redirect("Tutorlogin.aspx");
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

            maindiv.PreRender += new EventHandler(Panel1_OnPreRender);
        }
      
    }

    protected void Panel1_OnPreRender(object sender, EventArgs e)
    {

        ScriptManager.RegisterStartupScript(maindiv, maindiv.GetType(),
           "scrollPanelToBottom", "scrollPanelToBottom();", true);

    }

    protected void btnreply_Click(object sender, EventArgs e)
    {
        if (Session["Tid"] == null)
        {
            Response.Redirect("Tutorlogin.aspx");
        }
        string tid = Session["Tid"].ToString();
        string courseid = "";
        DateTime dat = DateTime.Now;
        string date = dat.ToString("yyyy/MM/dd HH:mm");
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

         if (txtreply.Text != "")
        {
            string ins = "Insert into DiscussionForum (Cid,Uid,Utype,Message,Datetime) values ('" + courseid + "','" + tid + "','Tutor','" + txtreply.Text + "','" + date + "')";
            SqlCommand cmd = new SqlCommand(ins, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LabelPrint.Text = "";
            updatechat();

        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Fill details')", true);
        }
    }

    protected void DropDownCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        updatechat();      
    }
    public void updatechat()
    {
        string Uid = "", Utype = "", Message = "", Datetime = "", Uname = "";
        if (Session["Tid"] == null)
        {
            Response.Redirect("Tutorlogin.aspx");
        }
        string tid = Session["Tid"].ToString();
        string selectcourseid = "Select Uid,Utype,Message,Datetime from DiscussionForum where Cid=(Select Cid from Course where Cname ='" + DropDownCourse.SelectedValue + "') order by Datetime desc";
        SqlDataAdapter da = new SqlDataAdapter(selectcourseid, con);
        DataSet dr = new DataSet();
        da.Fill(dr);
        if (dr.Tables[0].Rows.Count > 0)
        {
            
            for (int i = 0; i < dr.Tables[0].Rows.Count; i++)
            {
                Uid = dr.Tables[0].Rows[i][0].ToString();
                Utype = dr.Tables[0].Rows[i][1].ToString();
                Message = dr.Tables[0].Rows[i][2].ToString();
                Datetime = dr.Tables[0].Rows[i][3].ToString();

                if (Utype == "Student")
                {
                    string selectstuid = "Select Name from Student where Sid='" + Uid + "'";
                    SqlCommand sid = new SqlCommand(selectstuid, con);
                    con.Open();
                    SqlDataReader dr1 = sid.ExecuteReader();
                    if (dr1.HasRows)
                    {
                        dr1.Read();
                        Uname = dr1[0].ToString();
                    }
                    con.Close();
                }
                else
                {
                    string selectstuid = "Select Name from Tutor where Tid='" + Uid + "'";
                    SqlCommand sid = new SqlCommand(selectstuid, con);
                    con.Open();
                    SqlDataReader dr1 = sid.ExecuteReader();
                    if (dr1.HasRows)
                    {
                        dr1.Read();
                        Uname = dr1[0].ToString();
                    }
                    con.Close();
                }
               


                if (Uid == Session["Tid"].ToString())
                {
                    LabelPrint.Text += "<div class='col-md-7 shadow-lg p-2 w-100 p-3 mb-1 rounded mt-3 float-right ' style='background-color: antiquewhite; overflow: auto; z-index: 55'><span style='font-size: smaller; font-weight: bold'>" + Uname + "</span><br /><span>" + Message + "</span><br /><span style='font-size: smaller; float:right; font-weight: bold'>" + Datetime + "</span></div>";
                }
                else
                {
                    LabelPrint.Text += "<div class='col-md-7 shadow-lg p-2 w-100 p-3 mb-1  rounded mt-3' style='background-color: aliceblue; overflow: auto; z-index: 55'><span style='font-size: smaller; font-weight: bold'>" + Uname + "</span><br /><span>" + Message + "</span><br /><span style='font-size: smaller; float:right; font-weight: bold'>" + Datetime + "</span></div>";
                }


            }
        }
    }

    protected void ButtonRefresh_Click(object sender, EventArgs e)
    {
        LabelPrint.Text = "";
        updatechat();
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        LabelPrint.Text = "";
        updatechat();
    }
}