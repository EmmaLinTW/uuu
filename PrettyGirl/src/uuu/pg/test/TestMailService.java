package uuu.pg.test;
import uuu.pg.service.MailService;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */
public class TestMailService {

    public static void main(String[] args) {
        MailService.sendOrderSucessMailWithLogo("henrycats1990@hotmail.com",1); //請將null換成你的email信箱
    }
}
