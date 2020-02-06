<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Managenotes.aspx.cs" Inherits="Managenotes" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
        function showModal() {
            $("#myModal1").modal('show');
    }


    function openInNewTab(me)
    {
        var row = me.parentNode.parentNode;
        var rowIndex = row.rowIndex - 1;
        var name = row.cells[3].innerText;
        var url = "http://studfacc.hostoise.com/Docs/Tutorial/"+name;
        var url = window.open(url, '_blank');
        win.focus();
    }



    function checkReqFieldsnotes(me) {
            
        //var returnValue;
        var title = document.getElementById("<%=txttitle.ClientID%>").value;
        var desc = document.getElementById("<%=txtdesc.ClientID%>").value;
        var video = document.getElementById("<%=uploadNotes.ClientID%>").value;
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



    //function to check validation (Required field)
    function checkReqFields(me) {
        //var returnValue;
                    var title = document.getElementById("<%=titlevideo.ClientID%>").value;
                    var desc = document.getElementById("<%=descvideo.ClientID%>").value;
                    var video = document.getElementById("<%=UploadVideos.ClientID%>").value;
                    var course = document.getElementById("<%=DropDownCourse1.ClientID%>").value;
                    var subject = document.getElementById("<%=DropDownSubject1.ClientID%>").value;
                    
        //returnValue=true;
        if (title != "")
        {
            if (desc != "")
            {
                if (video != "")
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
                    alert("* Video Required");
                    //document.getElementById("reqapp").innerHTML = "* Select Application type.";
                    return false;
                }
            }
            else
            {
                alert("* Description Required");
                //document.getElementById("reqcity").innerHTML = "* City is required.";
                return false;
            }
        }
        else
        {
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
            <h2 class="text-dark">Manage Notes</h2>
        </div>

	    <div class="col-md-12 text-right mt-4">
            <div class="row">
                <div class="col-md-2">
                    <asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control" Height="35px" Width="214px" runat="server">
                        <asp:ListItem>Notes</asp:ListItem>
                        <asp:ListItem>Tutorial</asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="col-md-8 text-right">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal1">Add Tutorials </button>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Add Notes </button>
                </div>
            </div>
            
            
		    
           
	    </div>
	


           <div class="col-md-12">
		    <!-- Modal -->
		    <div class="modal fade" id="myModal1">
		      <div class="modal-dialog">
			    <div class="modal-content">

			      <!-- Modal Header -->
			      <div class="modal-header">
				    <h4 class="modal-title text-center">Add Videos</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body -->
			      <div class="modal-body">
				    <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>Video Title :</label>
                            <asp:TextBox ID="titlevideo"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Description :</label>
                            <asp:TextBox ID="descvideo" CssClass="form-control" runat="server" TextMode="MultiLine" ></asp:TextBox>
                            <br />
                        </div>
                        <div class="col-md-12">
                            <label>Video Upload :</label>
                            <asp:FileUpload ID="UploadVideos" runat="server" CssClass="form-control"  />
                            <br />
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                             <ContentTemplate>
                         <div class="col-md-12">
                            <label>Course Name :</label>
                             <asp:DropDownList ID="DropDownCourse1" OnSelectedIndexChanged="DropDownCourse1_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"   runat="server"></asp:DropDownList>
                            <br />
                            
                        </div>
                            <asp:Panel id="panel1" runat="server">
                         <div class="col-md-12">
                            <label>Subject Name :</label>
                             <asp:DropDownList ID="DropDownSubject1" CssClass="form-control" AutoPostBack="true" runat="server"></asp:DropDownList>
                            <br />
                            
                        </div>
                                </asp:Panel>
                                 </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>                                
			      

			      <!-- Modal footer -->
			      <div class="modal-footer">
                      <asp:Button ID="btnaddvideos" OnClientClick="return checkReqFields(this)" OnClick="btnaddvideos_Click" class="btn btn-success" runat="server" Text="Submit" />
				    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>
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
				    <h4 class="modal-title text-center">Add Notes</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body -->
			      <div class="modal-body">
				    <div class="col-md-12 mt-2">
                        <div class="col-md-12">
                            <label>Notes Title :</label>
                            <asp:TextBox ID="txttitle"  CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            
                        </div>
                        <div class="col-md-12">
                            <label>Description :</label>
                            <asp:TextBox ID="txtdesc" CssClass="form-control" runat="server" TextMode="MultiLine" ></asp:TextBox>
                            <br />
                        </div>
                        <div class="col-md-12">
                            <label>Notes Upload :</label>
                            <asp:FileUpload ID="uploadNotes" runat="server" CssClass="form-control"  />
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
                      <asp:Button ID="btnadd" OnClientClick="return checkReqFieldsnotes(this)"  OnClick="btnadd_Click" class="btn btn-success" runat="server" Text="Submit" />
				    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>
</div>
			    </div>
		      </div>
		    </div>
	    </div>
        <asp:Panel ID="Panel2" runat="server">
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
            </asp:Panel>


         <asp:Panel ID="Panel3" runat="server">
	    <div class="table-responsive mt-4">
                <asp:GridView ID="GridView2" class="table table-bordered table-striped text-center" AutoGenerateColumns="False"  runat="server" >
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
                                <input id="Button1" type="button" value="View" onclick="openInNewTab(this);" class="btn btn-outline-info" />
                                
                            
                            </ItemTemplate>
                        </asp:TemplateField>                                              
                        </Columns>
                </asp:GridView>
	    </div>
            </asp:Panel>

    </div>

</asp:Content>


