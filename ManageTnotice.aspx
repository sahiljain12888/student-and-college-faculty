<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageTnotice.aspx.cs" Inherits="ManageTnotice" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
        function showModal() {
            $("#myModal1").modal('show');
        }


    function checkReqFieldsnotes(me) {

        //var returnValue;
        var title = document.getElementById("<%=txttitle.ClientID%>").value;
        var desc = document.getElementById("<%=txtdesc.ClientID%>").value;
        var video = document.getElementById("<%=uploadNotice.ClientID%>").value;
        var course = document.getElementById("<%=DropDownCourse.ClientID%>").value;
        var subject = document.getElementById("<%=DropDownSubject.ClientID%>").value;

        //returnValue=true;
        if (title != "") {
            if (desc != "") {
                if (video != "") {
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
                    alert("* Notes Required");
                    //document.getElementById("reqapp").innerHTML = "* Select Application type.";
                    return false;
                }
            }
            else {
                alert("* Description Required");
                //document.getElementById("reqcity").innerHTML = "* City is required.";
                return false;
            }
        }
        else {
            alert("* Title Required");
            //document.getElementById("reqphone").innerHTML = "* Phone is required.";
            return false;
        }
    }



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <div class="container mt-5">

        <div class="col-md-12 text-center">
            <h2 class="text-dark">Manage Notice</h2>
        </div>

	    <div class="col-md-12 text-right mt-4">
		    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"> Add Notice </button>
	    </div>
	

	    <div class="col-md-12">
		    <!-- Modal -->
		    <div class="modal fade" id="myModal">
		      <div class="modal-dialog">
			    <div class="modal-content">

			      <!-- Modal Header -->
			      <div class="modal-header">
				    <h4 class="modal-title text-center">Add Notice</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body -->
			      <div class="modal-body">
				    <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>Notice Title :</label>
                            <asp:TextBox ID="txttitle"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Description :</label>
                            <asp:TextBox ID="txtdesc" CssClass="form-control" runat="server" TextMode="MultiLine" ></asp:TextBox>
                            <br />
                        </div>
                        <div class="col-md-12">
                            <label>Notice Upload :</label>
                            <asp:FileUpload ID="uploadNotice" runat="server" CssClass="form-control"  />
                            <br />
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <ContentTemplate>
                         <div class="col-md-12">
                            <label>Course Name :</label>
                             <asp:DropDownList ID="DropDownCourse" OnSelectedIndexChanged="DropDownCourse_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"   runat="server"></asp:DropDownList>
                            <br />
                            
                        </div>
                            <asp:Panel id="panelsubject" runat="server">
                         <div class="col-md-12">
                            <label>Subject Name :</label>
                             <asp:DropDownList ID="DropDownSubject" CssClass="form-control" AutoPostBack="true" runat="server"></asp:DropDownList>
                            <br />
                            
                        </div>
                                </asp:Panel>
                                 </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>                                
			      

			      <!-- Modal footer -->
			      <div class="modal-footer">
                      <asp:Button ID="btnadd" OnClick="btnadd_Click" OnClientClick="return checkReqFieldsnotes(this)"  class="btn btn-success" runat="server" Text="Submit" />
				    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>
</div>
			    </div>
		      </div>
		    </div>
	    </div>
	
	    <div class="table-responsive mt-4">
                <asp:GridView ID="GridView1" class="table table-bordered table-striped text-center" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"  runat="server" >
                    <Columns>
                        <asp:BoundField HeaderText="Did" DataField="Did" InsertVisible="False" ReadOnly="True" SortExpression="Did"  />
                        <asp:BoundField HeaderText="Title" DataField="Title" SortExpression="Title" />
                        <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />   
                        <asp:BoundField DataField="Docpath" HeaderText="Docpath" SortExpression="Docpath" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                         <asp:BoundField DataField="Tid" HeaderText="Tid" SortExpression="Tid" />
                        <asp:BoundField DataField="Cid" HeaderText="Cid" SortExpression="Cid" />
                        <asp:BoundField DataField="Sbid" HeaderText="Sbid" SortExpression="Sbid" />
                          <asp:TemplateField HeaderText="Update"  ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate >
                                <asp:Button ID="Button1" class="btn btn-outline-info" CommandName="down" CommandArgument='<%# Eval("Docpath" )%>'  runat="server" Text="Download"  CausesValidation="false"  />
                            
                                <asp:Button ID="Button2" class="btn btn-danger"   runat="server" Text="Delete"  CausesValidation="false"  CommandName="del" CommandArgument='<%# Eval("Docpath" )%>' />
                            </ItemTemplate>
                        </asp:TemplateField>                                              
                        </Columns>
                </asp:GridView>
	    </div>

    </div>

</asp:Content>


