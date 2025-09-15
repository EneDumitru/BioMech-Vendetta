using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class Util
{
    public static string PriceConvert(float price)
    {
        string priceKk = price.ToString();

        if (price > 10000 && price < 1000000)
        {
            priceKk = price / 1000 + "K";
        }
        else if (price > 1000000)
        {
            priceKk = price / 1000000 + "M";
        }
        return priceKk;
    }

    public static string PriceConvertDots(float _price)
    {
        return _price.ToString("n0").Replace(',', '.');
    }

    public static string PriceConvertDots(int _price)
    {
        return _price.ToString("n0").Replace(',', '.');
    }
}
