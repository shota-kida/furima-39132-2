window.addEventListener('load', () => { 
  const priceInput = document.getElementById("item-price");
  const feeOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const fee = Math.floor(inputValue * 0.1);
    const profit = inputValue - fee; 

    feeOutput.innerHTML = fee;
    profitOutput.innerHTML = profit;
  })
});