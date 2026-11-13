using projetoLeilao.DATABASE;

//using ProjetoLeilao.MAPEAMENTO;

try
{
    Conexao.Conectar();
}
catch (Exception ex)
{
    Console.WriteLine(ex.Message);
}