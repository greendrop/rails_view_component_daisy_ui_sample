import { Controller } from '@hotwired/stimulus'

export default class extends Controller<HTMLFormElement> {
  static targets = ['alert']

  declare readonly hasAlertTarget: boolean
  declare readonly alertTarget: HTMLInputElement
  declare readonly alertTargets: HTMLInputElement[]

  hide() {
    this.alertTarget.style.display = 'none'
  }
}
