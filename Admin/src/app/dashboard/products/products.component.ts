import { Component, OnInit } from '@angular/core';
import {ProductsService} from "../../service/products.service";
import {NgbModal, NgbModalConfig} from "@ng-bootstrap/ng-bootstrap";
import {FormControl, FormGroup} from "@angular/forms";

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.sass'],
  providers: [NgbModalConfig, NgbModal]
})
export class ProductsComponent implements OnInit {
  products: {}
  product: {
    productId: number,
    name: string,
    category: string
  }

  editForm = new FormGroup( {
    name: new FormControl(''),
    price: new FormControl(''),
    category: new FormControl('')
  })

  constructor(
    private productsService: ProductsService,
    config: NgbModalConfig,
    private modalService: NgbModal
  ) {
    config.backdrop = 'static';
    config.keyboard = false;
  }

  ngOnInit() {
    this.productsService.list().subscribe((result) => {
      this.products = result.data
    })
  }

  editModal(content, productData) {
    this.product = productData
    this.modalService.open(content)

    this.editForm = new FormGroup( {
      productId: new FormControl(`${productData.productId}`),
      name: new FormControl(`${productData.name}`),
      price: new FormControl(`${productData.price}`),
      category: new FormControl(`${productData.category}`)
    })
  }

  edit(data) {
    console.log(data)
    this.productsService.edit(data.value).subscribe(() => {
      this.ngOnInit()

    })
  }

  delete(id) {
    this.productsService.delete(id).subscribe(() => {
      this.ngOnInit()
    })
  }

}
