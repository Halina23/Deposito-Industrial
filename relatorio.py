import mysql.connector
import pandas as pd
import getpass

# 1. Solicitar a senha sem mostrar na tela
senha = getpass.getpass("Digite a senha do banco: ")

# 2. Conectar ao banco
conn = mysql.connector.connect(
    host="localhost",              # servidor MySQL
    port=3306,                     # porta padrão
    user="root",                   # usuário real do MySQL
    password=senha,                # senha digitada no momento da execução
    database="deposito_industrial" # nome real do banco
)

# 3. Consulta SQL
query = """
SELECT
  f.id_fornecedor, f.nome AS fornecedor,
  COUNT(p.id_pedido) AS total_pedidos,
  MIN(p.data_pedido) AS primeira_data,
  MAX(p.data_pedido) AS ultima_data
FROM pedidos_compra p
JOIN fornecedor f ON p.id_fornecedor = f.id_fornecedor
WHERE DATE(p.data_pedido) >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY f.id_fornecedor, f.nome
ORDER BY total_pedidos DESC
LIMIT 10;
"""

# 4. Ler resultado em DataFrame
df = pd.read_sql(query, conn)

# 5. Exportar para Excel (na mesma pasta do script)
arquivo_excel = "fornecedores.xlsx"
with pd.ExcelWriter(arquivo_excel, mode="w", engine="openpyxl") as writer:
    df.to_excel(writer, sheet_name="Top_Fornecedores", index=False)

# 6. Fechar conexão
conn.close()
print("Relatório gerado com sucesso!")