describe('Deals class', () => {
  it('has a helloWorld() function', () => {
    let deal = new Deal()
    expect(deal.helloWorld()).to.equal("hello world")
  });
  it('constucts a deal', () => {
    let deal = new Deal()
    expect(deal).to.be.an.instanceof(Deal)
  });
});