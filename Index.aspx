<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container" style="padding-top: 10%;">

	    <div class="col-md-12 mx-auto shadow-lg bg-white rounded" style="padding: 60px;">
	    <div class="row">
	    <div class="col-md-6">
	    <div class="col-md-6 mx-auto text-center">
            <a href="AdminLogin.aspx">
	    <i class="fa fa-user-circle text-secondary" style="font-size: 70px;"></i>
	    
		    <h4 class="text-secondary">Admin</h4>
	    </a>
	    </div>
	    </div>
	
	    <div class="col-md-6">
	    <div class="col-md-6 mx-auto text-center">
	   
	    <a href="Tutorlogin.aspx"> 
             <i class="fa fa-users text-secondary" style="font-size: 70px;"></i>
		    <h4 class="text-secondary">Tutor</h4>
	    </a>
	    </div>
	    </div>
	
	   
	    </div>
	    </div>

    </div>

</asp:Content>

