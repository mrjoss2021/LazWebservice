<?php 
		   echo "Selamat Datang Di WebService Semar IDE";
?> 
<?php 
	/*        
	 *WEB SERVICE JSON
	 *=====================================================
	 *Semar Database Wizard                                 
	 *Date : Sabtu 26 November 2022
	 */                                                    
	if ($_SERVER['REQUEST_METHOD'] == 'POST'){ //halaman ini harus dipanggil melalui post
	    $Database = $_POST["database"];
 	    $User = $_POST["user"];
 	    $Password = $_POST["password"];
	    $conn=mysql_connect('localhost',$User,$Password);
	    mysql_select_db($Database,$conn);
        //Add variabel service 
        
         $tab = $_POST["tab"]; 
         $pil = $_POST["job"];
         $kodesup=$_POST['kodesup'];
         $nama=$_POST['nama'];
         $alamat=$_POST['alamat'];
         $telepon=$_POST['telepon'];
         $perusahaan=$_POST['perusahaan'];
      //  echo "cek " .$tab;
          // fungsi buka table

          function buka($tab){                                                        
                                                                                                      
         		/*$sql = "select *                                              
         				from barang limit 10";*/                        
                                                                                      
         		$sql = mysql_query("select * from $tab ");                  
         		/**                                                              
         		langkah :                                                        
         		1. list kolom                                                    
         		2. list isi                                                      
         		**/                                                              
         		$result = array();                                               
         		$kolom= array();                                                 
         		$record = array();                                                
         		$records = array();                                              
         		if($sql){                                                      
         			//list kolom                                             
         			for ($i=0 ; $i<mysql_num_fields($sql) ; $i++){         
         				$kolom[] = mysql_field_name($sql,$i);          
         			}                                                        
                                                                                       
         			//list isi                                               
         			while($row = mysql_fetch_array($sql)){                 
         				$record = array();                               
         				for ($i=0 ; $i<mysql_num_fields($sql) ; $i++){ 
         					$record[] = $row[$i];             
         				}                                         
         				$records[] = $record;                     
                                                                                
         			}                                                 
         		}else{                                                    
         			$kolom[] = "error";                               
         			$records[] = array("sql error!");                
         		}                                                         
                                                                                
         		$result = array("column" => $kolom,"records"=>$records);  
         		echo json_encode($result);                                
         	}    
         
     //Fungsi isi data 
     function isi($tab,                   
                   $kodesup,
                   $nama,
                   $alamat,
                   $telepon,
                   $perusahaan) 
                   { 
                  $input=mysql_query("insert into $tab
                     values(                      
                  '$kodesup',
                  '$nama',
                  '$alamat',
                  '$telepon',
                   '$perusahaan')"); 
                   if ($input){                    
                       echo "Proses input Data Sukses"; 
                     }                                  
                     else                               
                    {                                   
                     echo mysql_error();                
                     }                                   
                       }                                 
    //Fungsi edit data 
    function edit($tab,                   
                   $kodesup,
                   $nama,
                   $alamat,
                   $telepon,
                   $perusahaan) 
                   { 
                   $edit=mysql_query("update $tab
                     set                      
                     nama='$nama',
                     alamat='$alamat',
                     telepon='$telepon',
                     perusahaan='$perusahaan'
                     where kodesup='$kodesup'"); 
                   if ($edit){                    
                       echo "Proses edit Data Sukses"; 
                     }                                  
                     else                               
                    {                                   
                     echo mysql_error();                
                     }                                   
                       }                                 
    //Fungsi hapus data 
    function del($tab,                   
                   $kodesup,
                   $nama,
                   $alamat,
                   $telepon,
                   $perusahaan) 
                   { 
                   $del=mysql_query("delete from $tab
                     where                      
                     kodesup='$kodesup' And 
                     nama='$nama' And 
                     alamat='$alamat' And 
                     telepon='$telepon' And 
                     perusahaan='$perusahaan'"); 
                   if ($del){                    
                       echo "Proses Hapus Data Sukses"; 
                     }                                  
                     else                               
                    {                                   
                     echo mysql_error();                
                     }                                   
                       }                                 
         // seleksi perintah  
          switch ($pil){       
          case 0:              
              buka($tab);       
                   Break;
          case 1:               
               isi($tab,             
                   $kodesup,
                   $nama,
                   $alamat,
                   $telepon,
                   $perusahaan);
                   Break;
          case 2:               
               edit($tab,             
                   $kodesup,
                   $nama,
                   $alamat,
                   $telepon,
                   $perusahaan);
                   Break;
          case 3:               
               del($tab,             
                   $kodesup,
                   $nama,
                   $alamat,
                   $telepon,
                   $perusahaan);
                   Break;
          } // end switch  
           
        } 
 ?>   