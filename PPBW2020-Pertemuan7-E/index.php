<DOCTYPE! html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Your Grades</title>
    </head>
    <body>
    <link href="style.css" rel="stylesheet" type="text/css">
    <div class="box">
    <center><h3> Nilai Anda </h3></center>
        <form action="" method="post">
            <center>
                <table border=0>
                    <tr>
                        <td>
                            Nama
                        </td>
                        <td>
                            <input type=text name="t1">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            NIM
                        </td>
                        <td>
                            <input type=text name="t2">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nilai Tugas
                        </td>
                        <td>
                            <input type=text name="t3">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nilai UTS
                        </td>
                        <td>
                            <input type=text name="t4">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nilai UAS
                        </td>
                        <td>
                            <input type=text name="t5">
                        </td>
                    </tr>
                </table>
                <br>
                <br>
                <input type=submit name="s" value="Hasil">
            </center>
            <?php
if(isset($_POST['s']))
{
    $a=$_POST['t1'];
    $a1=$_POST['t2'];
    $a2=$_POST['t3'];
    $a3=$_POST['t4'];
    $a4=$_POST['t5'];
    $sum=$a2+$a3+$a4;
    $avg=$sum/3;
    if($avg>=0&&$avg<60)
        $gradestat="Tidak Lulus";
    if($avg>=60)
        $gradestat="Lulus";
    if($avg>=0&&$avg<60)
        $grade="-";
    if($avg>=60&&$avg<70)
        $grade="C";
    if($avg>=70&&$avg<80)
        $grade="B";
    if($avg>=80)
        $grade="A";
    echo "<br><br>";
    echo "<font size=4><center>Nilai Akhir Anda: ".$avg."</center><br>"; 
    echo "<font size=4><center>Predikat: ".$grade."</center><br>";
    echo "<font size=4><center>Anda dinyatakan ".$gradestat."</center><br>"; 
}
            ?>
        </form>
    </div>
    </body>
</html>
