function sales () {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  priceInput.addEventListener('input', () => {
    const price = priceInput.value
    if(price == null){
      addTaxPrice.innerHTML = 0;
      profit.innerHTML = 0;
    }
    addTaxPrice.innerHTML = Math.floor(price * 0.1);
    profit.innerHTML = price - Math.floor(price * 0.1);
  });
}

window.addEventListener('load', sales)