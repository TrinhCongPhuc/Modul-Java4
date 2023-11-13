package ra.btcalcalator;


public class Calculator {
    public static float calculate(float firstOperand, float secondOperand, String operator ){
        switch (operator){
            case "+":
                return firstOperand + secondOperand;
            case "-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                if(secondOperand != 0)
                    return firstOperand / secondOperand;
                else
                    throw new RuntimeException("Không thể thực hiện phép chia với tham số thứ 2 là 0");
            default:
                throw new RuntimeException("Toán tử không hợp lệ");
        }
    }

}
