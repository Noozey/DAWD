<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="dawdd.Show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Show Management</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" Height="145px" Width="900px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="SHOWID" HeaderText="SHOWID" ReadOnly="True" SortExpression="SHOWID" />
                <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" SortExpression="MOVIEID" />
                <asp:BoundField DataField="HALLID" HeaderText="HALLID" SortExpression="HALLID" />
                <asp:BoundField DataField="HOLIDAYID" HeaderText="HOLIDAYID" SortExpression="HOLIDAYID" />
                <asp:BoundField DataField="SHOW_TIME" HeaderText="SHOW_TIME" SortExpression="SHOW_TIME" />
                <asp:BoundField DataField="SHOW_DATE" HeaderText="SHOW_DATE" SortExpression="SHOW_DATE" />
                <asp:BoundField DataField="BASE_PRICE" HeaderText="BASE_PRICE" SortExpression="BASE_PRICE" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;SHOWID&quot;, &quot;MOVIEID&quot;, &quot;HALLID&quot;, &quot;HOLIDAYID&quot;, &quot;SHOW_TIME&quot;, &quot;SHOW_DATE&quot;, &quot;BASE_PRICE&quot; FROM &quot;SHOW&quot;"
            InsertCommand="INSERT INTO &quot;SHOW&quot; (&quot;SHOWID&quot;, &quot;MOVIEID&quot;, &quot;HALLID&quot;, &quot;HOLIDAYID&quot;, &quot;SHOW_TIME&quot;, &quot;SHOW_DATE&quot;, &quot;BASE_PRICE&quot;) VALUES (:SHOWID, :MOVIEID, :HALLID, :HOLIDAYID, :SHOW_TIME, :SHOW_DATE, :BASE_PRICE)"
            UpdateCommand="UPDATE &quot;SHOW&quot; SET &quot;MOVIEID&quot; = :MOVIEID, &quot;HALLID&quot; = :HALLID, &quot;HOLIDAYID&quot; = :HOLIDAYID, &quot;SHOW_TIME&quot; = :SHOW_TIME, &quot;SHOW_DATE&quot; = :SHOW_DATE, &quot;BASE_PRICE&quot; = :BASE_PRICE WHERE &quot;SHOWID&quot; = :SHOWID"
            DeleteCommand="DELETE FROM &quot;SHOW&quot; WHERE &quot;SHOWID&quot; = :SHOWID">
            <DeleteParameters>
                <asp:Parameter Name="SHOWID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SHOWID" Type="String" />
                <asp:Parameter Name="MOVIEID" Type="String" />
                <asp:Parameter Name="HALLID" Type="String" />
                <asp:Parameter Name="HOLIDAYID" Type="String" />
                <asp:Parameter Name="SHOW_TIME" Type="String" />
                <asp:Parameter Name="SHOW_DATE" Type="DateTime" />
                <asp:Parameter Name="BASE_PRICE" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MOVIEID" Type="String" />
                <asp:Parameter Name="HALLID" Type="String" />
                <asp:Parameter Name="HOLIDAYID" Type="String" />
                <asp:Parameter Name="SHOW_TIME" Type="String" />
                <asp:Parameter Name="SHOW_DATE" Type="DateTime" />
                <asp:Parameter Name="BASE_PRICE" Type="Decimal" />
                <asp:Parameter Name="SHOWID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" Width="300px">
            <EditItemTemplate>
                SHOWID:
                <asp:Label ID="SHOWIDLabel1" runat="server" Text='<%# Eval("SHOWID") %>' />
                <br />
                MOVIEID:
                <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                <br />
                HALLID:
                <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                <br />
                HOLIDAYID:
                <asp:TextBox ID="HOLIDAYIDTextBox" runat="server" Text='<%# Bind("HOLIDAYID") %>' />
                <br />
                SHOW_TIME:
                <asp:TextBox ID="SHOW_TIMETextBox" runat="server" Text='<%# Bind("SHOW_TIME") %>' />
                <br />
                SHOW_DATE:
                <asp:TextBox ID="SHOW_DATETextBox" runat="server" Text='<%# Bind("SHOW_DATE") %>' />
                <br />
                BASE_PRICE:
                <asp:TextBox ID="BASE_PRICETextBox" runat="server" Text='<%# Bind("BASE_PRICE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                SHOWID:
                <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' />
                <br />
                MOVIEID:
                <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                <br />
                HALLID:
                <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                <br />
                HOLIDAYID:
                <asp:TextBox ID="HOLIDAYIDTextBox" runat="server" Text='<%# Bind("HOLIDAYID") %>' />
                <br />
                SHOW_TIME:
                <asp:TextBox ID="SHOW_TIMETextBox" runat="server" Text='<%# Bind("SHOW_TIME") %>' />
                <br />
                SHOW_DATE:
                <asp:TextBox ID="SHOW_DATETextBox" runat="server" Text='<%# Bind("SHOW_DATE") %>' />
                <br />
                BASE_PRICE:
                <asp:TextBox ID="BASE_PRICETextBox" runat="server" Text='<%# Bind("BASE_PRICE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
