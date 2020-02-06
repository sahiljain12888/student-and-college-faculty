<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Changepass.aspx.cs" Inherits="Changepass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-5">
        <div class="col-md-4 mx-auto shadow-lg p-3 mb-5 bg-white rounded mt-5">
            <div class="col-md-12 mt-2 text-center">
                <h3 class="text-secondary">Change Password</h3>
            </div>
            <div class="col-md-12 mt-4">
                <label>Current Password</label>
                <asp:TextBox ID="TextBoxcpass" CssClass="form-control" runat="server" TextMode="Password" required></asp:TextBox>
            </div>
            <div class="col-md-12 mt-2">
                <label>New Password</label>
                <asp:TextBox ID="TextBoxnpass" CssClass="form-control" runat="server" TextMode="Password" required></asp:TextBox>
            </div>
            <div class="col-md-12 mt-2">
                <label>Confirm New Password</label>
                <asp:TextBox ID="TextBoxcnpass" CssClass="form-control" runat="server" TextMode="Password" required></asp:TextBox>
            </div>
            <div class="col-md-12 mt-4">
                <asp:Button ID="Button1" CssClass="btn btn-success" OnClientClick="return validation()" OnClick="Button1_Click" runat="server" Text="Submit" />
            </div>
        </div>
    </div>
<script>

    function validation() {
    
        if (document.getElementById('ContentPlaceHolder1_TextBoxnpass').value != document.getElementById('ContentPlaceHolder1_TextBoxcnpass').value) {
            alert('Enter Confirm New Password same as new password!');
            return false;
        }
        

        return true;
    }
</script>
</asp:Content>

