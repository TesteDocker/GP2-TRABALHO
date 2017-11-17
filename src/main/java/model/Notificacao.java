package model;

import java.util.Date;

public class Notificacao {
	
	private int idnotificacao;
	private Date data_notificacao;
	private String bairro;
	private String rua;
	private String quadra;
	private String lote;
	private String numero;
	private String cidade;
	private String tp_imovel;
	private String desc_notificacao;
	private boolean verifcacao;
	
	public int getIdnotificacao() {
		return idnotificacao;
	}
	public void setIdnotificacao(int idnotificacao) {
		this.idnotificacao = idnotificacao;
	}
	public Date getData_notificacao() {
		return data_notificacao;
	}
	public void setData_notificacao(Date data_notificacao) {
		this.data_notificacao = data_notificacao;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	public String getQuadra() {
		return quadra;
	}
	public void setQuadra(String quadra) {
		this.quadra = quadra;
	}
	public String getLote() {
		return lote;
	}
	public void setLote(String lote) {
		this.lote = lote;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getTp_imovel() {
		return tp_imovel;
	}
	public void setTp_imovel(String tp_imovel) {
		this.tp_imovel = tp_imovel;
	}
	public String getDesc_notificacao() {
		return desc_notificacao;
	}
	public void setDesc_notificacao(String desc_notificacao) {
		this.desc_notificacao = desc_notificacao;
	}
	public boolean isVerifcacao() {
		return verifcacao;
	}
	public void setVerifcacao(boolean verifcacao) {
		this.verifcacao = verifcacao;
	}
	
	@Override
	public String toString() {
		return "Notificacao [idnotificacao=" + idnotificacao + ", data_notificacao=" + data_notificacao + ", bairro="
				+ bairro + ", rua=" + rua + ", quadra=" + quadra + ", lote=" + lote + ", numero=" + numero + ", cidade="
				+ cidade + ", tp_imovel=" + tp_imovel + ", desc_notificacao=" + desc_notificacao + ", verifcacao="
				+ verifcacao + "]";
	}
	
}
