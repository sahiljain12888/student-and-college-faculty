<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tutorsubject.aspx.cs" Inherits="Tutorsubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-5">
       <div class="col-md-12 mt-4">
                <asp:GridView ID="GridView1" class="table table-bordered table-striped text-center" AutoGenerateColumns="true"   runat="server">
                    <Columns>
                        <%--<asp:BoundField HeaderText="Cid" DataField="Cid"  />
                        <asp:BoundField HeaderText="Course" DataField="Cname" />
                        <asp:BoundField HeaderText="SubCname" DataField="SubCname" />   
                        <asp:TemplateField HeaderText="Update"  ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate >
                                <asp:Button ID="Button1" class="btn btn-info" CommandName="upd" CommandArgument='<%# Eval("Cid" )%>'  runat="server" Text="Update"  CausesValidation="false"  />
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                                                                                   
                        </Columns>
                </asp:GridView>
	    </div>
    </div>
</asp:Content>


