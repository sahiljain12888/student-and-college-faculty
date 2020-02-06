<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Managecourse.aspx.cs" Inherits="Managecourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
        function showModal() {
            $("#myModal1").modal('show');
        }


    function checkReqFields(me) {

        //var returnValue;
        var course = document.getElementById("<%=txtcourse.ClientID%>").value;
        var subcourse = document.getElementById("<%=txtsubcourse.ClientID%>").value;
        

        //returnValue=true;
        if (course != "") {
            if (subcourse != "") {
               
            }
            else {
                alert("* Dubcourse Required");
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
        var course = document.getElementById("<%=utxtcname.ClientID%>").value;
        var subcourse = document.getElementById("<%=utxtsubname.ClientID%>").value;


        //returnValue=true;
        if (course != "") {
            if (subcourse != "") {

            }
            else {
                alert("* Dubcourse Required");
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
            <h2 class="text-dark">Manage Course</h2>
        </div>

	    <div class="col-md-12 text-right mt-4">
		    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"> Add Course </button>
	    </div>
	
        <div class="col-md-12">
		    <!-- Modal -->
		    <div class="modal fade" id="myModal1">
		      <div class="modal-dialog">
			    <div class="modal-content">

			      <!-- Modal Header -->
			      <div class="modal-header">
				    <h4 class="modal-title text-center">Update Course</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body -->
			      <div class="modal-body">
				    <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>ID :</label>
                            <asp:TextBox ID="utxtid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Course Name :</label>
                            <asp:TextBox ID="utxtcname"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Sub Course :</label>
                            <asp:TextBox ID="utxtsubname" CssClass="form-control" runat="server" ></asp:TextBox>
                            <br />
                            
                        </div>
                    </div>                                
			      </div>

			      <!-- Modal footer -->
			      <div class="modal-footer">
                      <asp:Button ID="btn_upd"  OnClick="btn_upd_Click" OnClientClick="return checkReqFieldsupdate(this)"   class="btn btn-success" runat="server" Text="Update" />
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
				    <h4 class="modal-title text-center">Add Course</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body --> 
			      <div class="modal-body">
				    <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>Course Name :</label>
                            <asp:TextBox ID="txtcourse"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Sub Course :</label>
                            <asp:TextBox ID="txtsubcourse" CssClass="form-control" runat="server" ></asp:TextBox>
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
                <asp:GridView ID="GridView1" class="table table-bordered table-striped text-center" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand"  runat="server">
                    <Columns>
                        <asp:BoundField HeaderText="Cid" DataField="Cid"  />
                        <asp:BoundField HeaderText="Course" DataField="Cname" />
                        <asp:BoundField HeaderText="SubCname" DataField="SubCname" />   
                        <asp:TemplateField HeaderText="Update"  ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate >
                                <asp:Button ID="Button1" class="btn btn-info" CommandName="upd" CommandArgument='<%# Eval("Cid" )%>'  runat="server" Text="Update"  CausesValidation="false"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                                                                                   
                        </Columns>
                </asp:GridView>
	    </div>

    </div>

</asp:Content>

