package Model;
// Generated 24/01/2017 15:55:32 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * TbVeiculo generated by hbm2java
 */
public class Veiculo  implements java.io.Serializable {


     private int idVeiculo;
     private int idTipoVeiculo;
     private String placa;
     private String chassi;
     private Integer anoFabricacao;
     private Integer anoModelo;
     private Date dataAquisicao;
     private Date dataExclusao;
     private Integer capacidadePessoas;
     private Double cilindradas;
     private Double capacidadeCarga;
     private String fabricante;
     private String modelo;
     private String cor;
     private String renavam;
     private Integer idCombustivel;
     private Integer portas;
     private Double odometroAtual;
     private Character bloqueado;
     private String observacao;

    public Veiculo() {
    }

	
    public Veiculo(int idVeiculo, int idTipoVeiculo, String placa) {
        this.idVeiculo = idVeiculo;
        this.idTipoVeiculo = idTipoVeiculo;
        this.placa = placa;
    }
    
    public Veiculo(int idVeiculo, int idTipoVeiculo, String placa, String chassi, Integer anoFabricacao, Integer anoModelo, Date dataAquisicao, Date dataExclusao, Integer capacidadePessoas, Double cilindradas, Double capacidadeCarga, String fabricante, String modelo, String cor, String renavam, Integer idCombustivel, Integer portas, Double odometroAtual, Character bloqueado, String observacao) {
       this.idVeiculo = idVeiculo;
       this.idTipoVeiculo = idTipoVeiculo;
       this.placa = placa;
       this.chassi = chassi;
       this.anoFabricacao = anoFabricacao;
       this.anoModelo = anoModelo;
       this.dataAquisicao = dataAquisicao;
       this.dataExclusao = dataExclusao;
       this.capacidadePessoas = capacidadePessoas;
       this.cilindradas = cilindradas;
       this.capacidadeCarga = capacidadeCarga;
       this.fabricante = fabricante;
       this.modelo = modelo;
       this.cor = cor;
       this.renavam = renavam;
       this.idCombustivel = idCombustivel;
       this.portas = portas;
       this.odometroAtual = odometroAtual;
       this.bloqueado = bloqueado;
       this.observacao = observacao;
    }
    
    public Veiculo(int idTipoVeiculo, String placa, String chassi, Integer anoFabricacao, Integer anoModelo, Date dataAquisicao, Integer capacidadePessoas, Double cilindradas, Double capacidadeCarga, String fabricante, String modelo, String cor, String renavam, Integer idCombustivel, Integer portas, Double odometroAtual, Character bloqueado, String observacao) {
       this.idTipoVeiculo = idTipoVeiculo;
       this.placa = placa;
       this.chassi = chassi;
       this.anoFabricacao = anoFabricacao;
       this.anoModelo = anoModelo;
       this.dataAquisicao = dataAquisicao;
       this.capacidadePessoas = capacidadePessoas;
       this.cilindradas = cilindradas;
       this.capacidadeCarga = capacidadeCarga;
       this.fabricante = fabricante;
       this.modelo = modelo;
       this.cor = cor;
       this.renavam = renavam;
       this.idCombustivel = idCombustivel;
       this.portas = portas;
       this.odometroAtual = odometroAtual;
       this.bloqueado = bloqueado;
       this.observacao = observacao;
    }
   
    public int getIdVeiculo() {
        return this.idVeiculo;
    }
    
    public void setIdVeiculo(int idVeiculo) {
        this.idVeiculo = idVeiculo;
    }
    public int getIdTipoVeiculo() {
        return this.idTipoVeiculo;
    }
    
    public void setIdTipoVeiculo(int idTipoVeiculo) {
        this.idTipoVeiculo = idTipoVeiculo;
    }
    public String getPlaca() {
        return this.placa;
    }
    
    public void setPlaca(String placa) {
        this.placa = placa;
    }
    public String getChassi() {
        return this.chassi;
    }
    
    public void setChassi(String chassi) {
        this.chassi = chassi;
    }
    public Integer getAnoFabricacao() {
        return this.anoFabricacao;
    }
    
    public void setAnoFabricacao(Integer anoFabricacao) {
        this.anoFabricacao = anoFabricacao;
    }
    public Integer getAnoModelo() {
        return this.anoModelo;
    }
    
    public void setAnoModelo(Integer anoModelo) {
        this.anoModelo = anoModelo;
    }
    public Date getDataAquisicao() {
        return this.dataAquisicao;
    }
    
    public void setDataAquisicao(Date dataAquisicao) {
        this.dataAquisicao = dataAquisicao;
    }
    public Date getDataExclusao() {
        return this.dataExclusao;
    }
    
    public void setDataExclusao(Date dataExclusao) {
        this.dataExclusao = dataExclusao;
    }
    public Integer getCapacidadePessoas() {
        return this.capacidadePessoas;
    }
    
    public void setCapacidadePessoas(Integer capacidadePessoas) {
        this.capacidadePessoas = capacidadePessoas;
    }
    public Double getCilindradas() {
        return this.cilindradas;
    }
    
    public void setCilindradas(Double cilindradas) {
        this.cilindradas = cilindradas;
    }
    public Double getCapacidadeCarga() {
        return this.capacidadeCarga;
    }
    
    public void setCapacidadeCarga(Double capacidadeCarga) {
        this.capacidadeCarga = capacidadeCarga;
    }
    public String getFabricante() {
        return this.fabricante;
    }
    
    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }
    public String getModelo() {
        return this.modelo;
    }
    
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public String getCor() {
        return this.cor;
    }
    
    public void setCor(String cor) {
        this.cor = cor;
    }
    public String getRenavam() {
        return this.renavam;
    }
    
    public void setRenavam(String renavam) {
        this.renavam = renavam;
    }
    public Integer getIdCombustivel() {
        return this.idCombustivel;
    }
    
    public void setIdCombustivel(Integer idCombustivel) {
        this.idCombustivel = idCombustivel;
    }
    public Integer getPortas() {
        return this.portas;
    }
    
    public void setPortas(Integer portas) {
        this.portas = portas;
    }
    public Double getOdometroAtual() {
        return this.odometroAtual;
    }
    
    public void setOdometroAtual(Double odometroAtual) {
        this.odometroAtual = odometroAtual;
    }
    public Character getBloqueado() {
        return this.bloqueado;
    }
    
    public void setBloqueado(Character bloqueado) {
        this.bloqueado = bloqueado;
    }
    public String getObservacao() {
        return this.observacao;
    }
    
    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }




}


