using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Tutorsubject : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=43.255.152.26;Initial Catalog=StudFacC;Persist Security Info=True;User ID=StudFacC;Password=zE09up3$");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Tid"] == null)
        {
            Response.Redirect("Tutorlogin.aspx");
        }
        string tid = Session["Tid"].ToString();
        string sql = "SELECT Tutor.Name,Course.Cname,Subjects.Sname  FROM Tutor full JOIN TutorSubjects ON Tutor.Tid = TutorSubjects.Tid full join Subjects on subjects.Sbid = TutorSubjects.Sbid full join Course on Course.Cid = TutorSubjects.Cid where Tutor.Tid ='"+tid+"'";

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