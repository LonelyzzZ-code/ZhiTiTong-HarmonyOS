@Component
export struct Textinput{
  @Prop placeholder: string = '';
  @Link text1: string;
  build() {
    TextInput({ placeholder: this.placeholder})
      .width('100%')
      .height(48)
      .backgroundColor('#F2F3F5')
      .borderRadius(24)
      .onChange((value: string) => {
        console.log(value)
        this.text1 = value;
      })
  }
}