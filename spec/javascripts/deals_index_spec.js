describe('Deals index', () => {

  beforeEach(function () {
    MagicLamp.load('deals/index')  
  })

  describe('myDeals', () => {
    it('returns true', () => {
      expect($('#myDealsHeader')[0].innerHTML).to.include("Deals")
    });
  });
});