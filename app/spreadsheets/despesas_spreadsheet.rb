class DespesasSpreadsheet
  attr_accessor :despesas
  
  def initialize despesas
    @despesas = despesas
  end

  def generate_xls
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet name: "Despesas"

    create_body sheet

    data_to_send = StringIO.new
    book.write data_to_send
    data_to_send.string
  end

  def create_body sheet
    # Header row with a specific format
    sheet.row(0).concat %w{Numero Doc Emissao Razao Social Fornecedor Tomador RC Vencimento Duplicata Valor}
    sheet.row(0).default_format = Spreadsheet::Format.new weight: :bold

    row_index = 1
    despesas.each do |despesa|
      sheet.row(row_index).concat [despesa.nf, despesa.emissao_nota.strftime('%d/%m/%y'), despesa.fornecedor.name, "JF Oliveira Navegação", despesa.id, despesa.vencimento_nota, despesa.produtos.sum(:valor)]
      # sheet.row(row_index).default_format = Spreadsheet.Format.new # define a custom format
      row_index += 1
    end
  end
end
