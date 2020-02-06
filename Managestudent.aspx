<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Managestudent.aspx.cs" Inherits="Addstudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
        function showModal() {
            $("#myModal1").modal('show');
        }



    function checkReqFields(me) {

        //var returnValue;      
        var name = document.getElementById("<%=txtname.ClientID%>").value;
        var email = document.getElementById("<%=txtemail.ClientID%>").value;
        var contact = document.getElementById("<%=txtcontact.ClientID%>").value;
        var address = document.getElementById("<%=txtadd.ClientID%>").value;
        var cid = document.getElementById("<%=txtcid.ClientID%>").value;
        var pass = document.getElementById("<%=txtpass.ClientID%>").value;

        //returnValue=true;
        if (name != "")
        {
            if (email != "")
            {
                if (contact != "")
                {
                    if (address != "")
                    {
                        if (cid != "")
                        {
                            if (pass != "")
                            {
                                return true;
                            }
                   
                        else {
                                    alert("* password Required");
                                    //document.getElementById("reqpass").innerHTML = "* Password required.";
                                    return false;

                            }

                        } else
                        {
                                alert("* Cid Required");
                                //document.getElementById("reqpass").innerHTML = "* Password required.";
                                return false;

                        }
                    }
                    else {
                            alert("* address Required");
                            // document.getElementById("reqtype").innerHTML = "* Select Account Type.";
                            return false;
                        }
                    }
                    else {
                        alert("* contact Required");
                        //document.getElementById("reqapp").innerHTML = "* Select Application type.";
                        return false;
                    }
                }
                else {
                    alert("* email Required");
                    //document.getElementById("reqcity").innerHTML = "* City is required.";
                    return false;
                }
            }
            else {
                alert("* name Required");
                //document.getElementById("reqphone").innerHTML = "* Phone is required.";
                return false;
            }
        }




    function checkReqFieldsupdate(me) {
             

        //var returnValue;      
        var name = document.getElementById("<%=utxtname.ClientID%>").value;
        var email = document.getElementById("<%=utxtemail.ClientID%>").value;
        var contact = document.getElementById("<%=utxtcon.ClientID%>").value;
        var address = document.getElementById("<%=utxtadd.ClientID%>").value;
        var cid = document.getElementById("<%=utxtcid.ClientID%>").value;
        var pass = document.getElementById("<%=utxtpass.ClientID%>").value;

        //returnValue=true;
        if (name != "") {
            if (email != "") {
                if (contact != "") {
                    if (address != "") {
                        if (cid != "") {
                            if (pass != "") {
                                return true;
                            }

                            else {
                                alert("* password Required");
                                //document.getElementById("reqpass").innerHTML = "* Password required.";
                                return false;

                            }

                        } else {
                            alert("* Cid Required");
                            //document.getElementById("reqpass").innerHTML = "* Password required.";
                            return false;

                        }
                    }
                    else {
                        alert("* address Required");
                        // document.getElementById("reqtype").innerHTML = "* Select Account Type.";
                        return false;
                    }
                }
                else {
                    alert("* contact Required");
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
            alert("* name Required");
            //document.getElementById("reqphone").innerHTML = "* Phone is required.";
            return false;
        }
    }




</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-5">

        <div class="col-md-12 text-center">
            <h2 class="text-dark">Manage Students</h2>
        </div>

	    <div class="col-md-12 text-right mt-4">
		    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"> Add Student </button>
	    </div>
	
        <div class="col-md-12">
		    <!-- Modal -->
		    <div class="modal fade" id="myModal1">
		      <div class="modal-dialog">
			    <div class="modal-content">

			      <!-- Modal Header -->
			      <div class="modal-header">
				    <h4 class="modal-title text-center">Update Student Details</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body --> 
			      <div class="modal-body">
				   <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>ID :</label>
                            <asp:TextBox ID="utxtid" Enabled="false"  CssClass="form-control" runat="server"></asp:TextBox>
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
                            <label>Address :</label>
                            <asp:TextBox ID="utxtadd" CssClass="form-control" runat="server" ></asp:TextBox>
                            <br />
                            
                        </div>
                         <div class="col-md-12">
                            <label>Course ID :</label>
                            <asp:TextBox ID="utxtcid"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Pass :</label>
                            <asp:TextBox ID="utxtpass" CssClass="form-control" runat="server" ></asp:TextBox>
                            <br />
                            
                        </div>

                    </div>                         
			      </div>

			      <!-- Modal footer -->
			      <div class="modal-footer">
                      <asp:Button ID="btn_upd" OnClientClick="return checkReqFieldsupdate(this)"  OnClick="btn_upd_Click" class="btn btn-success" runat="server" Text="Update" />
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
				    <h4 class="modal-title text-center">Add Student Details</h4>
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
                            <label>Address :</label>
                            <asp:TextBox ID="txtadd" CssClass="form-control" runat="server" ></asp:TextBox>
                            <br />
                            
                        </div>
                         <div class="col-md-12">
                            <label>Course ID :</label>
                            <asp:TextBox ID="txtcid"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Pass :</label>
                            <asp:TextBox ID="txtpass" CssClass="form-control" runat="server" ></asp:TextBox>
                            <br />
                            
                        </div>

                    </div>                                
			      </div>

			      <!-- Modal footer -->
			      <div class="modal-footer">
                      <asp:Button ID="btnadd" OnClick="btnadd_Click"  OnClientClick="return checkReqFields(this)"   class="btn btn-success" runat="server" Text="Add" />
				    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>

			    </div>
		      </div>
		    </div>
	    </div>
	
	    <div class="col-md-12 mt-4">
                <asp:GridView ID="GridView1" class="table table-bordered table-striped text-center " AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand"  runat="server">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Sid" />
                        <asp:BoundField HeaderText="Name" DataField="Name"  />
                        <asp:BoundField HeaderText="Email" DataField="Email" />
                        <asp:BoundField HeaderText="Contact" DataField="Contact" />
                        <asp:BoundField HeaderText="Address" DataField="Address"  />
                        <asp:BoundField HeaderText="Cid" DataField="Cid" /> 
                        <asp:BoundField HeaderText="Pass" DataField="Pass" />     
                        <asp:TemplateField HeaderText="Update" >
                            <ItemTemplate >
                                <asp:Button ID="Button1" class="btn btn-info" CommandName="upd" CommandArgument='<%# Eval("Sid" )%>'  runat="server" Text="Update"  CausesValidation="false"  />

                                 <asp:Button ID="Button2" class="btn btn-danger" CommandName="del" CommandArgument='<%# Eval("Sid" )%>'  runat="server" Text="Delete"  CausesValidation="false"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                                                                                   
                        </Columns>
                </asp:GridView>
	    </div>

    </div>

</asp:Content>


