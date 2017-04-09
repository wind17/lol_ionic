<?php
/**根据用户id查询订单数据**/
header('Content-Type:application/json');

$output = [];

@$userid = $_REQUEST['userid'];

if(empty($userid)){
    echo "[]"; //若客户端未提交用户id，则返回一个空数组，
    return;    //并退出当前页面的执行
}

//访问数据库
require('init.php');

$sql = "SELECT lol_order.oid,lol_order.userid,lol_order.phone,lol_order.addr,
lol_order.totalprice,lol_order.user_name,lol_order.order_time,
lol_orderdetails.did,lol_orderdetails.dishcount,lol_orderdetails.price,
lol_dish.name,lol_dish.img_sm

 from lol_order,lol_orderdetails,lol_dish
WHERE lol_order.oid = lol_orderdetails.oid and lol_orderdetails.did = lol_dish.did and lol_order.userid='$userid'";
$result = mysqli_query($conn, $sql);

$output['data'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($output);
?>
