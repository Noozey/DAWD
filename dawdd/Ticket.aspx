<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="dawdd.Ticket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Ticket Management</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" Height="145px" Width="700px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="TICKETID" HeaderText="TICKETID" ReadOnly="True" SortExpression="TICKETID" />
                <asp:BoundField DataField="TICKET_PRICE" HeaderText="TICKET_PRICE" SortExpression="TICKET_PRICE" />
                <asp:BoundField DataField="PAID_STATUS" HeaderText="PAID_STATUS" SortExpression="PAID_STATUS" />
                <asp:BoundField DataField="BOOKING_STATUS" HeaderText="BOOKING_STATUS" SortExpression="BOOKING_STATUS" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;TICKETID&quot;, &quot;TICKET_PRICE&quot;, &quot;PAID_STATUS&quot;, &quot;BOOKING_STATUS&quot; FROM &quot;TICKET&quot;"
            InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKETID&quot;, &quot;TICKET_PRICE&quot;, &quot;PAID_STATUS&quot;, &quot;BOOKING_STATUS&quot;) VALUES (:TICKETID, :TICKET_PRICE, :PAID_STATUS, :BOOKING_STATUS)"
            UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;TICKET_PRICE&quot; = :TICKET_PRICE, &quot;PAID_STATUS&quot; = :PAID_STATUS, &quot;BOOKING_STATUS&quot; = :BOOKING_STATUS WHERE &quot;TICKETID&quot; = :TICKETID"
            DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKETID&quot; = :TICKETID">
            <DeleteParameters>
                <asp:Parameter Name="TICKETID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TICKETID" Type="String" />
                <asp:Parameter Name="TICKET_PRICE" Type="Decimal" />
                <asp:Parameter Name="PAID_STATUS" Type="String" />
                <asp:Parameter Name="BOOKING_STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TICKET_PRICE" Type="Decimal" />
                <asp:Parameter Name="PAID_STATUS" Type="String" />
                <asp:Parameter Name="BOOKING_STATUS" Type="String" />
                <asp:Parameter Name="TICKETID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" Width="300px">
            <EditItemTemplate>
                TICKETID:
                <asp:Label ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>' />
                <br />
                TICKET_PRICE:
                <asp:TextBox ID="TICKET_PRICETextBox" runat="server" Text='<%# Bind("TICKET_PRICE") %>' />
                <br />
                PAID_STATUS:
                <asp:TextBox ID="PAID_STATUSTextBox" runat="server" Text='<%# Bind("PAID_STATUS") %>' />
                <br />
                BOOKING_STATUS:
                <asp:TextBox ID="BOOKING_STATUSTextBox" runat="server" Text='<%# Bind("BOOKING_STATUS") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                TICKETID:
                <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' />
                <br />
                TICKET_PRICE:
                <asp:TextBox ID="TICKET_PRICETextBox" runat="server" Text='<%# Bind("TICKET_PRICE") %>' />
                <br />
                PAID_STATUS:
                <asp:TextBox ID="PAID_STATUSTextBox" runat="server" Text='<%# Bind("PAID_STATUS") %>' />
                <br />
                BOOKING_STATUS:
                <asp:TextBox ID="BOOKING_STATUSTextBox" runat="server" Text='<%# Bind("BOOKING_STATUS") %>' />
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

