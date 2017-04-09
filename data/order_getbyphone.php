<?php
header("Content-Type:application/json");

@$phone = $_REQUEST['phone'];
if(empty($phone))
{
    echo '[]';
    return;
}

require('init.php');

$sql = "select lol_order.user_name,lol_order.did,lol_order.oid,lol_order.order_time,lol_order.addr,lol_dish.img_sm from lol_dish,lol_order where lol_order.did=lol_dish.did AND lol_order.phone='$phone'";
$result = mysqli_query($conn,$sql);
$output = [];
while(true)
{
    $row = mysqli_fetch_assoc($result);
    if(!$row)
    {
        break;
    }
    $output[] = $row;
}

echo json_encode($output);



?>