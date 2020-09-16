<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">


    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs)
        args.IsValid = IsDate(args.Value)
    End Sub

    Protected Sub btnOk_Click(sender As Object, e As EventArgs)
        lblItemSelected.Text = "Favorito: " & RadioButtonList.SelectedValue
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Atividade 2</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" ForeColor="#347BD3" Text="Minha Agenda"></asp:Label>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Não há registros de dados a serem exibidos." ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                            <asp:BoundField DataField="Telefone" HeaderText="Telefone" SortExpression="Telefone" />
                            <asp:BoundField DataField="Nascimento" HeaderText="Nascimento" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_AGENDAConnectionString1 %>" DeleteCommand="DELETE FROM [agenda] WHERE [Id] = @Id" InsertCommand="INSERT INTO [agenda] ([Nome], [Telefone], [Nascimento]) VALUES (@Nome, @Telefone, @Nascimento)" SelectCommand="SELECT [Id], [Nome], [Telefone], [Nascimento] FROM [agenda]" UpdateCommand="UPDATE [agenda] SET [Nome] = @Nome, [Telefone] = @Telefone, [Nascimento] = @Nascimento WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Nome" Type="String" />
                            <asp:Parameter Name="Telefone" Type="String" />
                            <asp:Parameter Name="Nascimento" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Nome" Type="String" />
                            <asp:Parameter Name="Telefone" Type="String" />
                            <asp:Parameter Name="Nascimento" Type="DateTime" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333">
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            Nome:
                            <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                            <br />
                            Telefone:
                            <asp:TextBox ID="TelefoneTextBox" runat="server" Text='<%# Bind("Telefone") %>' />
                            <br />
                            Nascimento:
                            <asp:TextBox ID="NascimentoTextBox" runat="server" Text='<%# Bind("Nascimento") %>' />
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="NascimentoTextBox" Display="Dynamic" ErrorMessage="Formato de data invalido" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True" ValidateEmptyText="True"></asp:CustomValidator>
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Inserir" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Novo" />
                        </ItemTemplate>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Qual seu esporte favorito?"></asp:Label>
        <br />
        <asp:RadioButtonList ID="RadioButtonList" runat="server">
            <asp:ListItem>Futebol</asp:ListItem>
            <asp:ListItem>Corrida</asp:ListItem>
            <asp:ListItem>Ciclismo</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" Text="Ok" />
        <br />
        <asp:Label ID="lblItemSelected" runat="server"></asp:Label>
    </form>
</body>
</html>
