<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Managesubject.aspx.cs" Inherits="Managesubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
        function showModal() {
            $("#myModal1").modal('show');
        }




    function checkReqFields(me) {

        //var returnValue;
        var course = document.getElementById("<%=txtcid.ClientID%>").value;
        var subcourse = document.getElementById("<%=txtsubname.ClientID%>").value;


        //returnValue=true;
        if (course != "") {
            if (subcourse != "") {

            }
            else {
                alert("* Subject name Required");
                //document.getElementById("reqcity").innerHTML = "* City is required.";
                return false;
            }
        }
        else {
            alert("* Course Required");
            //document.getElementById("reqphone").innerHTML = "* Phone is required.";
            return false;
        }
    }



    function checkReqFieldsupdate(me) {

        //var returnValue;
        var course = document.getElementById("<%=utxtcid.ClientID%>").value;
        var subcourse = document.getElementById("<%=utxtsname.ClientID%>").value;


        //returnValue=true;
        if (course != "") {
            if (subcourse != "") {

            }
            else {
                alert("* Subject Name Required");
                //document.getElementById("reqcity").innerHTML = "* City is required.";
                return false;
            }
        }
        else {
            alert("* Course Required");
            //document.getElementById("reqphone").innerHTML = "* Phone is required.";
            return false;
        }
    }




    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-5">

        <div class="col-md-12 text-center">
            <h2 class="text-dark">Manage Subject</h2>
        </div>

	    <div class="col-md-12 text-right mt-4">
		    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"> Add Subject </button>
	    </div>
	
        <div class="col-md-12">
		    <!-- Modal -->
		    <div class="modal fade" id="myModal1">
		      <div class="modal-dialog">
			    <div class="modal-content">

			      <!-- Modal Header -->
			      <div class="modal-header">
				    <h4 class="modal-title text-center">Update Subject</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body -->
			      <div class="modal-body">
				    <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>ID :</label>
                            <asp:TextBox ID="utxtsid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Course ID :</label>
                            <asp:TextBox ID="utxtcid"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Subject Name :</label>
                            <asp:TextBox ID="utxtsname" CssClass="form-control" runat="server" ></asp:TextBox>
                            <br />
                            
                        </div>
                    </div>                                
			      </div>

			      <!-- Modal footer -->
			      <div class="modal-footer">
                      <asp:Button ID="btn_upd" OnClick="btn_upd_Click" OnClientClick="return checkReqFieldsupdate(this)" class="btn btn-success" runat="server" Text="Update" />
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
				    <h4 class="modal-title text-center">Add Subject</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body -->
			      <div class="modal-body">
				    <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>Course ID :</label>
                            <asp:TextBox ID="txtcid"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Subject Name :</label>
                            <asp:TextBox ID="txtsubname" CssClass="form-control" runat="server" ></asp:TextBox>
                            <br />
                            
                        </div>
                    </div>                                
			      </div>

			      <!-- Modal footer -->
			      <div class="modal-footer">
                      <asp:Button ID="btnadd" OnClick="btnadd_Click" OnClientClick="return checkReqFields(this)"  class="btn btn-success" runat="server" Text="Submit" />
				    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>

			    </div>
		      </div>
		    </div>
	    </div>
	
	    <div class="col-md-12 mt-4">
                <asp:GridView ID="GridView1" class="table table-bordered table-striped text-center " AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand"  runat="server">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Sbid" />
                        <asp:BoundField HeaderText="Cid" DataField="Cid"  />
                        <asp:BoundField HeaderText="Sname" DataField="Sname" />   
                        <asp:TemplateField HeaderText="Update" >
                            <ItemTemplate >
                                <asp:Button ID="Button1" class="btn btn-info" CommandName="upd" CommandArgument='<%# Eval("Sbid" )%>'  runat="server" Text="Update"  CausesValidation="false"  />

                                <asp:Button ID="Button2" class="btn btn-danger" CommandName="del" CommandArgument='<%# Eval("Sbid" )%>'  runat="server" Text="Delete"  CausesValidation="false"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                                                                                   
                        </Columns>
                </asp:GridView>
	    </div>

    </div>

</asp:Content>


