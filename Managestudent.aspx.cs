using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


public partial class Addstudent : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string sql = "Select * from Student";
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

    protected void btnadd_Click(object sender, EventArgs e)
    {

        if (txtname.Text != "" && txtemail.Text != "" && txtcontact.Text != "" && txtadd.Text != "" && txtcid.Text != "" && txtpass.Text != "")
        {
            string ins = "Insert into student (Name,Email,Contact,Address,Cid,Pass) values ('" + txtname.Text + "','" + txtemail.Text + "','" + txtcontact.Text + "','" + txtadd.Text + "','" + txtcid.Text + "','" + txtpass.Text + "')";
            SqlCommand cmd = new SqlCommand(ins, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Student Added Susscessfully.')", true);
            Response.Redirect("Managestudent.aspx");
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
            string selectcmd = "SELECT Sid,Name,Email,Contact,Address,Cid,Pass FROM Student where Sid='" + id + "'";
            SqlCommand cmd = new SqlCommand(selectcmd, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                utxtid.Text = dr[0].ToString();
                utxtname.Text = dr[1].ToString();
                utxtemail.Text = dr[2].ToString();
                utxtcon.Text = dr[3].ToString();
                utxtadd.Text = dr[4].ToString();
                utxtcid.Text = dr[5].ToString();
                utxtpass.Text = dr[6].ToString();
            }
        }
        else if (e.CommandName == "del")
        {

            int id = Convert.ToInt16(e.CommandArgument.ToString());
            string upd = " delete from Student where Sid = '" + id + "'";
            SqlCommand cmd = new SqlCommand(upd, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Students Deleted Susscessfully.')", true);
            Response.Redirect("Managestudent.aspx");
        }
    }

    protected void btn_upd_Click(object sender, EventArgs e)
    {
        if (utxtid.Text != "" && utxtname.Text != "" && utxtemail.Text != "" && utxtcon.Text != "" && utxtadd.Text != "" && utxtcid.Text != "" && utxtpass.Text != "")
        {
            string upd = " update student set  Name = '" + utxtname.Text + "', Email = '" + utxtemail.Text + "', Contact = '" + utxtcon.Text + "', Address = '" + utxtadd.Text + "', Cid = '" + utxtcid.Text + "', Pass = '" + utxtpass.Text + "' where Sid = '" + utxtid.Text + "'";
            SqlCommand cmd = new SqlCommand(upd, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Students Updated Susscessfully.')", true);
            Response.Redirect("Managestudent.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Fill details')", true);
        }
    }
}