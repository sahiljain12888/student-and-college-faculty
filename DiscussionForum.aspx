<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DiscussionForum.aspx.cs" Inherits="DiscussionForum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        <%--$(document).ready(function () {
            $("#<%=DropDownCourse.ClientID%>").change(function () {
              var  height = parseInt($("#<%=LabelPrint.ClientID%>").height());
                $('#main').animate({ scrollTop: height });



            });
        });--%>

function scrollPanelToBottom() {
 
   var panel = document.getElementById('<%=maindiv.ClientID %>');
   panel.scrollTop = panel.scrollHeight;
 
}
            
      
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
     <div class="container mt-5">

        <div class="col-md-12 text-center">
            <h2 class="text-dark">Discussion Forum</h2>
        </div>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                
	    <div class="col-md-12 text-right mt-4">
            <asp:Button ID="ButtonRefresh" CssClass="btn btn-info" OnClick="ButtonRefresh_Click" runat="server" Text="Refresh" />
            <asp:DropDownList ID="DropDownCourse"  class="btn btn-info"  runat="server" OnSelectedIndexChanged="DropDownCourse_SelectedIndexChanged"  AutoPostBack="true">
                
            </asp:DropDownList>
             <asp:Timer ID="Timer1" runat="server" Interval="10000" OnTick="Timer1_Tick">
                </asp:Timer>
	    </div>

         <div id='maindiv' runat="server" class='col-md-10 mx-auto shadow-lg p-2 w-100 p-3 mb-1 rounded mt-3' style='background-color: gainsboro; height: 350px;overflow-y: scroll;overflow-x: hidden;' >

            <div class='col-md-12 ' id="chat" >
         
             <asp:Label ID="LabelPrint" runat="server"></asp:Label>
           
             
             </div> 
            
         </div>


   <!--   <div class='col-md-10 mx-auto shadow-lg p-2 w-100 p-3 mb-1 rounded mt-3 overflow-auto' style='background-color: gainsboro;height:300px'><div class='col-md-12'><div class='col-md-7 shadow-lg p-2 w-100 p-3 mb-1 bg-light-blue rounded mt-3' style='background-color: aliceblue; overflow: auto; z-index: 55'><span style='font-size: smaller; font-weight: bold'>NAME</span><br /><span>MESSAGE</span><br /><span style='font-size: smaller; float:right; font-weight: bold'>time</span></div><div class='col-md-7 shadow-lg p-2 w-100 p-3 mb-1 rounded mt-3 float-right' style='background-color: antiquewhite; overflow: auto; z-index: 55'><span>'UNAME</span><br /><span>U MESSAGE</span></div></div></div>--%>

        


        <!--*****reply********-->
        <div class="col-md-10 mx-auto shadow-lg p-2 w-100 p-3 mb-1 rounded mt-3" style="background-color: gainsboro ">
            <asp:TextBox ID="txtreply" placeholder="Type your Reply Here..." CssClass="form-control p-2 m-2" Height="75px" TextMode="MultiLine" runat="server"></asp:TextBox>
            <div class="text-right">
            <asp:Button ID="btnreply" CssClass="btn btn-primary" OnClick="btnreply_Click" runat="server" Text="Reply" />
                </div>
        </div>
                 
          <!--*************-->
	          </ContentTemplate>
         </asp:UpdatePanel>
	    

    </div>
</asp:Content>

