<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Managetutor.aspx.cs" Inherits="Managetutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .test {
            display: none;
        }
    </style>
<script type="text/javascript">
    function showModal()
    {
            $("#myModal1").modal('show');
    }

    function checkReqFields(me) {


        //var returnValue;txtname     

        var name = document.getElementById("<%=txtname.ClientID%>").value;
        var email = document.getElementById("<%=txtemail.ClientID%>").value;
        var con = document.getElementById("<%=txtcontact.ClientID%>").value;
        var pass = document.getElementById("<%=txtpass.ClientID%>").value;
        var course = document.getElementById("<%=DropDownCourse.ClientID%>").value;
        var subject = document.getElementById("<%=DropDownSubject.ClientID%>").value;

        //returnValue=true;
        if (name != "") {
            if (email != "") {
                if (con != "") {
                    if (pass != "") {
                        if (course != "--Select--" && course != "") {
                            if (subject != "--Select--" && subject != "") {
                                return true;
                            }
                            else {
                                alert("* Subject Required");
                                //document.getElementById("reqpass").innerHTML = "* Password required.";
                                return false;
                            }
                        }
                        else {
                            alert("* Course Required");
                            // document.getElementById("reqtype").innerHTML = "* Select Account Type.";
                            return false;
                        }
                    }
                    else {
                        alert("* Password Required");
                        // document.getElementById("reqtype").innerHTML = "* Select Account Type.";
                        return false;
                    }
                }
                else {
                    alert("* Contact Required");
                    //document.getElementById("reqapp").innerHTML = "* Select Application type.";
                    return false;
                }
            }
            else {
                alert("* Email Required");
                //document.getElementById("reqcity").innerHTML = "* City is required.";
                return false;
            }
        }
        else {
            alert("* Name Required");
            //document.getElementById("reqphone").innerHTML = "* Phone is required.";
            return false;
        }
    }


    function checkReqFieldsupdate(me)
    {
              

        //var returnValue;txtname txtemail txtcontact txtpass DropDownCourse DropDownSubject
       
        var name = document.getElementById("<%=utxtname.ClientID%>").value;
        var email = document.getElementById("<%=utxtemail.ClientID%>").value;
        var con = document.getElementById("<%=utxtcon.ClientID%>").value;
        var pass = document.getElementById("<%=utxtpass.ClientID%>").value;
        var course = document.getElementById("<%=DropDownupdatecourse.ClientID%>").value;
        var subject = document.getElementById("<%=DropDownupdateSubject.ClientID%>").value;

        //returnValue=true;
        if (name != "")
        {
            if (email != "")
            {
                if (con != "")
                {
                    if (pass != "")
                    {
                        if (course != "--Select--" && course != "")
                        {
                            if (subject != "--Select--" && subject != "")
                            {
                               return true;
                            }
                            else
                            {
                                alert("* Subject Required");
                                //document.getElementById("reqpass").innerHTML = "* Password required.";
                                return false;
                            }
                        }
                        else
                        {
                            alert("* Course Required");
                            // document.getElementById("reqtype").innerHTML = "* Select Account Type.";
                            return false;
                        }
                    }
                    else
                    {
                        alert("* Password Required");
                        // document.getElementById("reqtype").innerHTML = "* Select Account Type.";
                        return false;
                    }
                }
                else
                {
                    alert("* Contact Required");
                    //document.getElementById("reqapp").innerHTML = "* Select Application type.";
                    return false;
                }
            }
            else
            {
                alert("* Email Required");
                //document.getElementById("reqcity").innerHTML = "* City is required.";
                return false;
            }
        }
        else
        {
            alert("* Name Required");
            //document.getElementById("reqphone").innerHTML = "* Phone is required.";
            return false;
        }
    }


    function GetSelecteddetailsRow(me)
    {
            var row = me.parentNode.parentNode;
            var rowIndex = row.rowIndex - 1;
            var ID = row.cells[0].innerText;
            var name = row.cells[1].innerText;
            var email = row.cells[2].innerText;
            var contact = row.cells[3].innerText;
            var password = row.cells[4].innerText;
            var course = row.cells[6].innerText;
            var subject = row.cells[8].innerText;
            
            document.getElementById('<%=utxtid.ClientID%>').value = ID;
        document.getElementById('<%=utxtname.ClientID%>').value = name;
        document.getElementById('<%=utxtemail.ClientID%>').value = email;
        document.getElementById('<%=utxtcon.ClientID%>').value = contact;
        document.getElementById('<%=utxtpass.ClientID%>').value = password;
        document.getElementById('<%=DropDownupdatecourse.ClientID%>').value = course;
        document.getElementById('<%=DropDownupdateSubject.ClientID%>').value = subject;
        var str = course.trim();
        if (str == "")
        {
            document.getElementById('<%=DropDownupdatecourse.ClientID%>').value = "--Select--";
        }
        }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                        <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>

    <div class="container mt-5">

        <div class="col-md-12 text-center">
            <h2 class="text-dark">Manage Tutor</h2>
        </div>

	    <div class="col-md-12 text-right mt-4">
		    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"> Add Tutor </button>
	    </div>
	
        <div class="col-md-12">
		    <!-- Modal -->
		    <div class="modal fade" id="myModal1">
		      <div class="modal-dialog">
			    <div class="modal-content">

			      <!-- Modal Header -->
			      <div class="modal-header">
				    <h4 class="modal-title text-center">Add Tutor</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body -->
			      <div class="modal-body">
				   <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>ID :</label>
                            <asp:TextBox ID="utxtid"   CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Name :</label>
                            <asp:TextBox ID="utxtname"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Email :</label>
                            <asp:TextBox ID="utxtemail" CssClass="form-control" runat="server" TextMode="Email" ></asp:TextBox>
                            <br />
                            
                        </div>
                         <div class="col-md-12">
                            <label>Contact :</label>
                            <asp:TextBox ID="utxtcon"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Pass :</label>
                            <asp:TextBox ID="utxtpass" CssClass="form-control" runat="server" ></asp:TextBox>
                            <br />
                            
                        </div>
                       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                             <ContentTemplate>

                                  <div class="col-md-12">
                            <label>Course :</label>
                             <asp:DropDownList ID="DropDownupdatecourse" OnSelectedIndexChanged="DropDownupdatecourse_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"   runat="server"></asp:DropDownList>
                            <br />
                            
                        </div>
                                 
                                 <asp:HiddenField ID="hfcount" runat="server" />
                            <asp:Panel id="panel1" runat="server" >
                          <div class="col-md-12">
                            <label>Subject :</label>
                             <asp:DropDownList ID="DropDownupdateSubject" CssClass="form-control" AutoPostBack="true" runat="server"></asp:DropDownList>
                            <br />
                            
                        </div>
                                </asp:Panel>
                                 </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>                         
			      </div>

			      <!-- Modal footer -->
			      <div class="modal-footer">
                      <asp:Button ID="btn_upd" OnClick="btn_upd_Click"   OnClientClick="return checkReqFieldsupdate(this)"  class="btn btn-success" runat="server" Text="Update" />
				    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>

			    </div>
		      </div>
		    </div>
	    </div>

	    <div class="col-md-12">
		    <!-- Modal -->
		    <div class="modal fade" id="myModal">
		      <div class="modal-dialog">
			    <div class="modal-content">

			      <!-- Modal Header -->
			      <div class="modal-header">
				    <h4 class="modal-title text-center">Add Tutor</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body -->
			      <div class="modal-body"> 
				    <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>Name :</label>
                            <asp:TextBox ID="txtname"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Email :</label>
                            <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" TextMode="Email" ></asp:TextBox>
                            <br />
                            
                        </div>
                         <div class="col-md-12">
                            <label>Contact :</label>
                            <asp:TextBox ID="txtcontact"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Pass :</label>
                            <asp:TextBox ID="txtpass" CssClass="form-control" runat="server" ></asp:TextBox>
                            <br />
                            
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <ContentTemplate>
                         <div class="col-md-12">
                            <label>Course :</label>
                             <asp:DropDownList ID="DropDownCourse" OnSelectedIndexChanged="DropDownCourse_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"   runat="server"></asp:DropDownList>
                            <br />
                            
                        </div>
                            <asp:Panel id="panelsubject" runat="server" >
                         <div class="col-md-12">
                            <label>Subject :</label>
                             <asp:DropDownList ID="DropDownSubject" CssClass="form-control" AutoPostBack="true" runat="server"></asp:DropDownList>
                            <br />
                            
                        </div>
                                </asp:Panel>
                                 </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>                                
			      </div>

			      <!-- Modal footer -->
			      <div class="modal-footer">
                      <asp:Button ID="btnadd" OnClick="btnadd_Click" OnClientClick="return checkReqFields(this)"   class="btn btn-success" runat="server" Text="Add" />
				    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>

			    </div>
		      </div>
		    </div>
	    </div>
	
	    <div class="col-md-12 mt-4">
                <asp:GridView ID="GridView1" class="table table-bordered table-striped text-center " AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand"  runat="server">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Tid" />
                        <asp:BoundField HeaderText="Name" DataField="Name"  />
                        <asp:BoundField HeaderText="Email" DataField="Email" />
                        <asp:BoundField HeaderText="Contact" DataField="Contact" /> 
                        <asp:BoundField HeaderText="Pass" DataField="Pass" />
                         <asp:BoundField HeaderText="Cid" DataField="Cid" ItemStyle-CssClass="test" HeaderStyle-CssClass="test" />
                        <asp:BoundField HeaderText="Cname" DataField="Cname" />
                        <asp:BoundField HeaderText="Sbid" DataField="Sbid" ItemStyle-CssClass="test" HeaderStyle-CssClass="test"/> 
                        <asp:BoundField HeaderText="Sname" DataField="Sname" />       
                        <asp:TemplateField HeaderText="Update" >
                            <ItemTemplate >
                                <asp:Button ID="Button1" class="btn btn-info" CommandName="upd" OnClientClick="GetSelecteddetailsRow(this)" CommandArgument='<%# Eval("Tid" )%>'  runat="server" Text="Update"    />
                            </ItemTemplate>
                        </asp:TemplateField>
                                                                                   
                        </Columns>
                </asp:GridView>
	    </div>

    </div>

</asp:Content>



