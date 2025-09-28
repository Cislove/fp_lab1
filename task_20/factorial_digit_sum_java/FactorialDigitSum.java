import java.math.BigInteger;

public class FactorialDigitSum{
    private static BigInteger factorial(int n){
        BigInteger result = BigInteger.ONE;

        for(int i = 2; i <= n; i++){
            result = result.multiply(BigInteger.valueOf(i));
        }
        return result;
    }

    private static int sumOfDigit(BigInteger factorial){
        String digits = factorial.toString();
        int result = 0;

        for(var c: digits.toCharArray()){
            result += c - '0';
        }
        return result;
    }

    public static void main(String[] args){
        System.out.println(sumOfDigit(factorial(Integer.parseInt(args[0]))));
    }
}