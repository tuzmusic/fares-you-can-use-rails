class Vacation {
  constructor({ id, name, start_date, end_date, deals }) {
    this.id = id;
    this.name = name;
    this.start_date = new Date(start_date);
    this.end_date = new Date(end_date);
    this.deals = deals.map(d => new Deal(d));
  }

  indexParagraph() {
    let str = `<div class="vacation">${this.indexTitle()}${this.dealsParagraphs()}</div>`;
    return str;
  }

  dealsParagraphs() {
    let str = this.deals.map(d => d.indexParagraph()).join('')
    debugger;
    return str;
  }

  indexTitle() {
    return `<h3>${this.name}: ${this.dateRangeHTML()}</h3>`;
  }

  dateRangeHTML() {
    return `${this.start_date.toDateString()} to ${this.end_date.toDateString()}`;
  }
}
