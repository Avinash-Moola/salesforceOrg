import { LightningElement } from 'lwc';

export default class MapComponent extends LightningElement {
    mapMarkers = [
        {
            location: {
                City: 'Hyderabad',
                Country: 'INDIA',
                PostalCode: '500084',
            },
            mapIcon: {
                path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
                fillColor: 'red',
                fillOpacity: .8,
                strokeWeight: 0,
                scale: .10,
                anchor: {x: 122.5, y: 115}
                },
        },
    ];
}