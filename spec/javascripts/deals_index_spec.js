describe('Deals index', () => {

  beforeEach(function () {
    MagicLamp.load('deals/index')  
  })

  describe('deals index', () => {
    it('shows the "My Deals" header on load when logged in', () => {
      expect($("#my-deals-active-all-deals-linked")[0].hidden).to.equal(false)
      expect($("#all-deals-active-my-deals-linked")[0].hidden).to.equal(true)
    });
    it('switches headers when you click on "All Deals', () => {
      $("#my-deals-active-all-deals-linked a")[0].click()
      expect($("#my-deals-active-all-deals-linked")[0].hidden).to.equal(true)
      expect($("#all-deals-active-my-deals-linked")[0].hidden).to.equal(false)
    });
  });
});