<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Adminlogin.aspx.cs" Inherits="Adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-5">
	    <div class="row">
	    <div class="col-md-4 mx-auto shadow-lg p-3 mb-5 bg-white rounded mt-5">
		    <div class="col-md-12 text-center">
			    <h4 class="text-primary">Admin Login</h4>
		    </div>
		    <div class="form-group">
			<label for="email">Username:</label>
            <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" TextMode="SingleLine" required=""></asp:TextBox>
		    </div>
		    <div class="form-group">
			<label for="pwd">Password:</label>
			<asp:TextBox ID="txtpass" CssClass="form-control" runat="server" TextMode="Password" required=""></asp:TextBox>
		    </div> 
            <asp:Button ID="btnlogin" CssClass="btn btn-primary" OnClick="btnlogin_Click" runat="server" Text="Login" />
		    
	    </div>
	    </div>
    </div>
</asp:Content>

