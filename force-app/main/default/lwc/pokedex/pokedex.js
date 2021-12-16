import { api, LightningElement } from 'lwc';

export default class Pokedex extends LightningElement {
    pokeImg
    pokeName
    pokeType = "";
    @api
    pokeIndex;
  
    connectedCallback() {
      this.pokeIndex =Math.floor(Math.random()*804);
      //fetch(`https://pokeapi.co/api/v2/pokemon/${this.pokeIndex}`)

      fetch(`https://pokeapi.co/api/v2/pokemon/${this.pokeIndex}`)

          .then(response => response.json())

          .then(data => {
              if(data.name != undefined){

              let nameConvert = data.name.substring(0,1);

              this.pokeName = nameConvert.toUpperCase() + data.name.substring(1);
              
                for(let element of data.types){
                  this.pokeType += element.type.name + " ";
                }
              }
  
              this.pokeImg = data.sprites.front_default;
          })
    }
}





