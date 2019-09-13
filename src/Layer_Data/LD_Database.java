/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Data;

import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author KGR
 */
public class LD_Database {
    public int eye;
    public String Response;
    
    LD_Connection ConnectionSQLSERVER;
    

    public LD_Database() 
    {
        ConnectionSQLSERVER = new LD_Connection();
    }
    
    public String ExportDB(String URL_MySQLDump, String URL, String Name)
    {
        if(URL.trim().length()!=0)
        {
            try
            {   /*Para poder utilizar Mysql o mysqldump desde el cmd de Windows es necesario
                tener configurado el path del directorio bin de Mysql, en ocaciones no se configura
                al instalarlo y es necesario hacerlo manualmente
                1. Administrador de archivos
                2. Este PC, Click derecho
                3. Propiedades
                4. Configuracion Avanzada de Sistema
                5. Variables de entorno
                6. En variables de sistema
                7. Seleccionar Path
                8. Editar
                9. Nuevo
                10. Agregar ruta donde esta mysql -- C:\Program Files\MariaDB 10.3\bin
                KGRSystems@localhost*/
                Process p = Runtime.getRuntime().exec(URL_MySQLDump +"\\mysqldump -u "+ConnectionSQLSERVER.getUs()+" -p"+ ConnectionSQLSERVER.getPass()+" "+ConnectionSQLSERVER.getBd()+"");
            
                InputStream is = p.getInputStream();

                FileOutputStream fos = new FileOutputStream(URL+Name);

                byte[] buffer = new byte[1000];

                int leido = is.read(buffer);

                while(leido > 0)
                {
                    //0 iniciar donde quedo en el paso anterior 1 desde el principio
                    fos.write(buffer, 0, leido);
                    leido = is.read(buffer);
                }
                fos.close();
                Response = "Backup Create: "+URL;
            }catch(Exception ex)
            {
                Response = "Backup Not Create: "+ex.getMessage();
                System.out.println(ex.getMessage());
            }
        }
        return Response;
    }
    
   
}
