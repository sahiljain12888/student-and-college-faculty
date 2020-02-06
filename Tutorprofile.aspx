<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tutorprofile.aspx.cs" Inherits="Tutorprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-5">
        <div class="col-md-4 mx-auto shadow-lg p-3 mb-5 bg-white rounded mt-5">
            <div class="col-md-12 mt-2 text-center">
                <h2 class="text-secondary">Profile</h2>
            </div>
            <div class="col-md-12 mt-2">
                <label>Name :</label>
                <asp:Label ID="lblname" CssClass="form-control" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-12 mt-2">
                <label>Email :</label>
                <asp:Label ID="lblemail" CssClass="form-control" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-12 mt-2">
                <label>Contact :</label>
                <asp:Label ID="lblcon" CssClass="form-control" runat="server" Text=""></asp:Label>
            </div>
            <br />
            <div class="col-md-12 mt-2 text-center">
                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModal"> Edit Profile </button>
            </div>
        </div>
	
	    <div class="col-md-12">
		    <!-- Modal -->
		    <div class="modal fade" id="myModal">
		      <div class="modal-dialog">
			    <div class="modal-content">

			      <!-- Modal Header -->
			      <div class="modal-header">
				    <h4 class="modal-title">My Profile</h4>
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

			      <!-- Modal body -->
			      <div class="modal-body">
				    <div class="col-md-12 mt-2">
                        <label>Name</label>
                        <asp:TextBox ID="txtname" CssClass="form-control" runat="server" required=""></asp:TextBox>
                    </div>
                    <div class="col-md-12 mt-2">
                        <label>Email</label>
                        <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" TextMode="Email" required=""></asp:TextBox>
                    </div>
                    <div class="col-md-12 mt-2">
                        <label>Contact</label>
                        <asp:TextBox ID="txtcon" CssClass="form-control" runat="server" TextMode="Number" required=""></asp:TextBox>
                    </div>
			      </div>

			      <!-- Modal footer -->
			      <div class="modal-footer">
                    <asp:Button ID="btnupd" CssClass="btn btn-success" OnClick="btnupd_Click" runat="server" Text="Submit" />
				    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>

			    </div>
		      </div>
		    </div>
	    </div>
    </div>
</asp:Content>

