using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Managetutor : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            hfcount.Value = "Notchanged";
            string sql = "SELECT Tutor.Tid,Tutor.Name,Tutor.Email,Tutor.Contact,Tutor.Pass,TutorSubjects.Cid,Course.Cname,TutorSubjects.Sbid,Subjects.Sname  FROM Tutor full JOIN TutorSubjects ON Tutor.Tid = TutorSubjects.Tid full join Subjects on subjects.Sbid = TutorSubjects.Sbid full join Course on Course.Cid = TutorSubjects.Cid WHERE Tutor.TID != ''";

            SqlDataAdapter da1 = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            da1.Fill(ds);
            int i = ds.Tables[0].Rows.Count;
            if (i > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }


            string co = "Select Cname from Course";
            SqlDataAdapter daa1 = new SqlDataAdapter(co, con);
            DataSet myDataSet = new DataSet();
            daa1.Fill(myDataSet, "Course");
            DropDownCourse.DataSource = myDataSet;
            DropDownCourse.DataBind();
            DropDownCourse.DataTextField = "Cname";
            DropDownCourse.DataValueField = "Cname";
            DropDownCourse.DataBind();
            DropDownCourse.Items.Insert(0, "--Select--");



            string co1 = "Select Cname from Course";
            SqlDataAdapter d1 = new SqlDataAdapter(co1, con);
            DataSet myDataSet1 = new DataSet();
            d1.Fill(myDataSet1, "Course");
            DropDownupdatecourse.DataSource = myDataSet1;
            DropDownupdatecourse.DataBind();
            DropDownupdatecourse.DataTextField = "Cname";
            DropDownupdatecourse.DataValueField = "Cname";
            DropDownupdatecourse.DataBind();
            DropDownupdatecourse.Items.Insert(0, "--Select--");

        }
    }
    protected void DropDownCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownSubject.SelectedValue != "--Select--")
        {
            panelsubject .Visible = true;
            string selectcmd = "Select Sname from Subjects where Cid =(Select Cid from Course where Cname='" + DropDownCourse.SelectedValue + "')";
            SqlDataAdapter daa1 = new SqlDataAdapter(selectcmd, con);
            DataSet myDataSet = new DataSet();
            daa1.Fill(myDataSet, "Subjects");
            DropDownSubject.DataSource = myDataSet;
            DropDownSubject.DataBind();
            DropDownSubject.DataTextField = "Sname";
            DropDownSubject.DataValueField = "Sname";
            DropDownSubject.DataBind();
            
        }
       

    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        int id;
        string courseid = "";
        string subjectid = "";
        if (txtname.Text != "" && txtemail.Text != "" && txtcontact.Text != "" &&  txtpass.Text != "")
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

            
            string seltid = "select Tid from TutorSubjects where Cid='" + courseid + "' and  Sbid= '" + subjectid + "'";
            SqlDataAdapter dat = new SqlDataAdapter(seltid, con);
            DataSet dst = new DataSet();
            dat.Fill(dst);
            int k = dst.Tables[0].Rows.Count;
            if (k == 0)
            {
                string ins = "Insert into Tutor (Name,Email,Contact,Pass) values ('" + txtname.Text + "','" + txtemail.Text + "','" + txtcontact.Text + "','" + txtpass.Text + "')";
                SqlCommand cmd = new SqlCommand(ins, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();


                string sel = "select top 1 Tid from Tutor order by Tid desc";
                SqlDataAdapter da = new SqlDataAdapter(sel, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                int i = ds.Tables[0].Rows.Count;
                if (i > 0)
                {
                    id = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                }
                else
                {
                    id = 101;
                }



                string insts = "Insert into TutorSubjects (Tid,Cid,Sbid) values ('" + id + "','" + courseid + "','" + subjectid + "')";
                SqlCommand cmdts = new SqlCommand(insts, con);
                con.Open();
                cmdts.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Tutor Added Susscessfully.')", true);
                Response.Redirect("Managetutor.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Subject Assigned To Alternate Tutor')", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Fill details')", true);
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "upd")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
            int id = Convert.ToInt16(e.CommandArgument.ToString());
            string co2 = "Select Sname from Subjects where Cid =(Select Cid from Course where Cname='" + DropDownupdatecourse.SelectedValue + "')";
            SqlDataAdapter d2 = new SqlDataAdapter(co2, con);
            DataSet myDataSet2 = new DataSet();
            d2.Fill(myDataSet2, "Subjects");
            DropDownupdateSubject.DataSource = myDataSet2;
            DropDownupdateSubject.DataBind();
            DropDownupdateSubject.DataTextField = "Sname";
            DropDownupdateSubject.DataValueField = "Sname";
            DropDownupdateSubject.DataBind();
        }
    }

    protected void btn_upd_Click(object sender, EventArgs e)
    {
        if (utxtid.Text != "" && utxtname.Text != "" && utxtemail.Text != "" && utxtcon.Text != "" &&  utxtpass.Text != "")
        {
            string upd = " update Tutor set  Name = '" + utxtname.Text + "', Email = '" + utxtemail.Text + "', Contact = '" + utxtcon.Text + "',  Pass = '" + utxtpass.Text + "' where Tid = '" + utxtid.Text + "'";
            SqlCommand cmd = new SqlCommand(upd, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            //Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Tutor Updated Susscessfully.')", true);
           

            if (hfcount.Value == "Changed")
            {
                string courseid = "";
                string subjectid = "";
                string selectcourseid = "Select Cid from Course where Cname='" + DropDownupdatecourse.SelectedValue + "'";
                SqlCommand Cid = new SqlCommand(selectcourseid, con);
                con.Open();
                SqlDataReader dr = Cid.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    courseid = dr[0].ToString();
                }
                con.Close();
                string selectsubjectid = "Select Sbid from Subjects where Sname='" + DropDownupdateSubject.SelectedValue + "'";
                SqlCommand Sid = new SqlCommand(selectsubjectid, con);
                con.Open();
                SqlDataReader drs = Sid.ExecuteReader();

                if (drs.HasRows)
                {
                    drs.Read();
                    subjectid = drs[0].ToString();
                }
                con.Close();


                string seltid = "select Tid from TutorSubjects where Cid='" + courseid + "' and  Sbid= '" + subjectid + "'";
                SqlDataAdapter dat = new SqlDataAdapter(seltid, con);
                DataSet dst = new DataSet();
                dat.Fill(dst);
                int k = dst.Tables[0].Rows.Count;
                if (k == 0)
                {

                    string updt = " update TutorSubjects set  Cid = '" + courseid + "', Sbid = '" + subjectid + "' where Tid = '" + utxtid.Text + "'";
                    SqlCommand cmd1 = new SqlCommand(updt, con);
                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("Managetutor.aspx");

                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Subject Assigned To Alternate Tutor')", true);
                }
        }
            //Response.Redirect("Managetutor.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Fill details')", true);
        }
    }



    protected void DropDownupdatecourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfcount.Value = "Changed";
        if (DropDownSubject.SelectedValue != "--Select--")
        {
            panelsubject.Visible = true;
           string co2 = "Select Sname from Subjects where Cid =(Select Cid from Course where Cname='" + DropDownupdatecourse.SelectedValue + "')";
            SqlDataAdapter d2 = new SqlDataAdapter(co2, con);
            DataSet myDataSet2 = new DataSet();
            d2.Fill(myDataSet2, "Subjects");
            DropDownupdateSubject.DataSource = myDataSet2;
            DropDownupdateSubject.DataBind();
            DropDownupdateSubject.DataTextField = "Sname";
            DropDownupdateSubject.DataValueField = "Sname";
            DropDownupdateSubject.DataBind();
        }

    }
}