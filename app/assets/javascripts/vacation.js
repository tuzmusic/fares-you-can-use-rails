class Vacation {
  constructor({ id, name, start_date, end_date, deals }) {
    this.id = id;
    this.name = name;
    this.start_date = new Date(start_date);
    this.end_date = new Date(end_date);
    this.deals = deals.map(d => new Deal(d));
  }

  indexParagraph() {
    let str = `<div class="vacation">${this.indexTitle()}`;
    if (this.deals.length > 0) {
      str += `${this.dealsParagraphs()}`;
    } else {
      str += `No deals during ${this.name} ☹️ ☹️ ☹️`;
    }
    str += `</div>`;
    return str;
  }

  dealsParagraphs() {
    return this.deals.map(d => d.indexParagraph()).join("");
  }

  indexTitle() {
    return `<h3>${this.name}: ${this.dateRangeHTML()}</h3>`;
  }

  dateRangeHTML() {
    return `${this.start_date.toDateString()} to ${this.end_date.toDateString()}`;
  }

  vacationsListParagraph(userID) {
    return (
      `<p><b>${this.name}</b> ` +
      `<a href="" onclick="deleteVacation(${this.id}, ${userID}); return false;">(delete)</a>` +
      `<br>` +
      this.dateRangeHTML().replace("to", "-") +
      "</p>"
    );
  }
}
