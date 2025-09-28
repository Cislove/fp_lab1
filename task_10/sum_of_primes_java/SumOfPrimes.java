public class SumOfPrimes{
    public long sumOfPrimes(int n){
        long result = 0;
        for(int i = 2; i <= n; i++){
            result += isPrime(i) ? i : 0;
        }
        return result;
    }

    private boolean isPrime(int n){
        if (n < 2) return false;

        for(int i = 2; i <= (int) Math.sqrt(n); i++){
            if (n % i == 0){
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args){
        SumOfPrimes sp = new SumOfPrimes();
        System.out.println(sp.sumOfPrimes(Integer.parseInt(args[0])));
    }
}