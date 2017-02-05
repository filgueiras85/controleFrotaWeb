/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.VeiculoDAO;
import Model.Veiculo;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sergio.dorneles
 */
public class VeiculoController {

    public Veiculo listaUnicoVeiculo(String placa) {
        VeiculoDAO veiculoDAO = new VeiculoDAO();
        Veiculo veiculo = veiculoDAO.recuperarUnicoVeiculo(placa);
        return veiculo;
    }

    public List listaTodosVeiculos() {
        VeiculoDAO veiculoDAO = new VeiculoDAO();
        List veiculos = veiculoDAO.recuperarTodosVeiculos();
        return veiculos;
    }

    public List listaTodosVeiculosAtivos() {
        VeiculoDAO veiculoDAO = new VeiculoDAO();
        List veiculos = veiculoDAO.recuperarTodosVeiculosAtivos();
        return veiculos;
    }

    public List listaTodosVeiculosInativos() {
        VeiculoDAO veiculoDAO = new VeiculoDAO();
        List veiculos = veiculoDAO.recuperarTodosVeiculosInativos();
        return veiculos;
    }

    public List listaTodosVeiculosLiberados() {
        VeiculoDAO veiculoDAO = new VeiculoDAO();
        List veiculos = veiculoDAO.recuperarTodosVeiculosLiberados();
        return veiculos;
    }

    public List listaTodosVeiculosBloqueados() {
        VeiculoDAO veiculoDAO = new VeiculoDAO();
        List veiculos = veiculoDAO.recuperarTodosVeiculosBloqueados();
        return veiculos;
    }

    public String salvaVeiculo(String tipoVeiculo, String placa, String chassi,
            int anoFabricacao, int anoModelo, String dataAquisicao, int capacidadePessoas,
            double cilindradas, double capacidadeCarga, String fabricante, String modelo,
            String cor, String renavam, String combustivel, int portas, double odometroAtual,
            char bloqueado, String observacao) {

        int tipoCombustivelInt = new CombustivelController().listaCombustivelId(combustivel);
        int tipoVeiculoInt = new TipoVeiculoController().listaTipoVeiculoId(tipoVeiculo);

        Veiculo veiculo = null;
        try {
            veiculo = new Veiculo(tipoVeiculoInt,
                    placa,
                    chassi,
                    anoFabricacao,
                    anoModelo,
                    new java.sql.Timestamp(new SimpleDateFormat("dd/MM/yyyy").parse(dataAquisicao).getTime()),
                    capacidadePessoas,
                    cilindradas,
                    capacidadeCarga,
                    fabricante,
                    modelo,
                    cor,
                    renavam,
                    tipoCombustivelInt,
                    portas,
                    odometroAtual,
                    bloqueado,
                    observacao);
        } catch (ParseException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String resultado = new VeiculoDAO().salvarVeiculo(veiculo);
        return resultado;
    }

    public String removeVeiculo(String placa) {
        Veiculo veiculo = this.listaUnicoVeiculo(placa);
        veiculo.setDataExclusao(new java.sql.Timestamp(new Date().getTime()));
        String resultado = new VeiculoDAO().atualizarVeiculo(veiculo);
        return resultado;
    }

    public String bloqueiaVeiculo(String placa) {
        Veiculo veiculo = this.listaUnicoVeiculo(placa);
        veiculo.setBloqueado('s');
        String resultado = new VeiculoDAO().atualizarVeiculo(veiculo);
        return resultado;
    }

    public String desbloqueiaVeiculo(String placa) {
        Veiculo veiculo = this.listaUnicoVeiculo(placa);
        veiculo.setBloqueado('n');
        String resultado = new VeiculoDAO().atualizarVeiculo(veiculo);
        return resultado;
    }

    public String atualizaVeiculo(String tipoVeiculo, String placa, String chassi,
            int anoFabricacao, int anoModelo, String dataAquisicao, int capacidadePessoas,
            double cilindradas, double capacidadeCarga, String fabricante, String modelo,
            String cor, String renavam, String combustivel, int portas, double odometroAtual,
            char bloqueado, String observacao) {

        int tipoCombustivelInt = new CombustivelController().listaCombustivelId(combustivel);
        int tipoVeiculoInt = new TipoVeiculoController().listaTipoVeiculoId(tipoVeiculo);

        Veiculo veiculo = this.listaUnicoVeiculo(placa);
        try {
            veiculo.setIdTipoVeiculo(tipoVeiculoInt);
            veiculo.setChassi(chassi);
            veiculo.setAnoFabricacao(anoFabricacao);
            veiculo.setAnoModelo(anoModelo);
            veiculo.setDataAquisicao(new java.sql.Timestamp(new SimpleDateFormat("dd/MM/yyyy").parse(dataAquisicao).getTime()));
            veiculo.setCapacidadePessoas(capacidadePessoas);
            veiculo.setCilindradas(cilindradas);
            veiculo.setCapacidadeCarga(capacidadeCarga);
            veiculo.setFabricante(fabricante);
            veiculo.setModelo(modelo);
            veiculo.setCor(cor);
            veiculo.setRenavam(renavam);
            veiculo.setIdCombustivel(tipoCombustivelInt);
            veiculo.setPortas(portas);
            veiculo.setOdometroAtual(odometroAtual);
            veiculo.setBloqueado(bloqueado);
            veiculo.setObservacao(observacao);
        } catch (ParseException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
        String resultado = new VeiculoDAO().atualizarVeiculo(veiculo);
        return resultado;
    }
}
