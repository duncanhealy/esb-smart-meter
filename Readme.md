# ESB smart meter

## Objective 

Gathering information on how to read the smart meter model

- Omnipower (RM106 Kamstrup)

## How to read the meter

```text
Here are the commands to interact with the interface on the smart meter.
on the LCD
When you see L1+ (arrow pointing right) the meter is importing from the network
When you see L1- (arrow pointing left) the meter is exporting from the network

Date/Time Display
Press the left pushbutton to select the time/date screen. The first screen shows the time, the second screen shows the date. The screens alternate every 5 seconds.
A+ Screen
Press the left pushbutton again to select the A+ display. This is the total reading.
This is the reading required by all MCC01 customers.
A+ T1 Screen
Press the left pushbutton again to select the T1 display. This is the night reading.
The T1 indication will flash between T1 and A+ in the upper right corner while showing this reading.
A+ T2 Screen
Press the left pushbutton again to select the T2 display. This is the day reading.
The T2 indication will flash between T2 and A+ in the upper right corner while showing this reading.
A+ T3 Screen
Press the left pushbutton again to select the T3 display. This is the peak reading.
The T3 indication will flash between T3 and A+ in the upper right corner while showing this reading.
LCD Test Screen
Press the left pushbutton again to select the LCD screen test display. All segments of the LCD screen now flash
A + Screen
Press the left pushbutton again to select the A- display. This is the total active energy export register
R+ Screen
Press the left pushbutton again to select the R+ display. This is the total reactive energy imported.
R- Screen
Press the left pushbutton again to select the R- display. This is the total reactive energy exported.
```

## Links to relevant docs

- [esb doc](https://www.esbnetworks.ie/existing-connection/meters-readings/how-to-read-your-meter/electronic-business-meters)
- [reading the meter vid from esb](https://www.youtube.com/embed/hPbVoIpxFeIA)
- [brochure](https://www.esbnetworks.ie/docs/default-source/publications/smart-metering-leave-behind-brochure.pdf?sfvrsn=59a707f0_5)
- [2g connect spec and license](https://www.comreg.ie/media/dlm_uploads/2017/07/ComReg-1767.pdf)
- [rmd smart project](https://rmdservice.com/wp-content/uploads/2018/12/esbn-smart-igg-presentation-jan-2019.pdf)
- [kamstrup and siemens](https://new.siemens.com/ie/en/company/news/kamstrup-and-siemens-to-roll-out-large-scale-smart-metering-project-in-ireland.html)

- [dpia](https://www.esbnetworks.ie/docs/default-source/default-document-library/smart-metering-register-data-dpia.pdf?sfvrsn=abee01f0_0)


## smart meter app ?

- [smart me app](https://web.smart-me.com/en/project/smart-me-app-2/)
- [smart me](https://web.smart-me.com/en/project/kamstrup-module/)
- [smart me auto export](https://doc.smart-me.com/configuration/auto-export)
- [module](https://doc.smart-me.com/products/kamstrup-module)

## data from esb acquired!! :smiley:

## response from esb

![response page 1](2021-03-24-17-50-22.png)
![response page 2](2021-03-24-17-51-14.png)
![response page 3](2021-03-24-17-52-02.png)

## steps to extract the data

export the data from excel file to `data.csv`

- `make install` to install requirements

- `make split` to split the data from ESB networks
- `make insert-data` to insert the data to sqlite db
- `make serve` to test the data locally
- `make publish` to publish the data to vercel

## examine the data
- site deployed to https://esb-smart-meter.vercel.app/
- graphql endpoint at https://esb-smart-meter.vercel.app/graphql
```gql
{
  runningtotal_export(sort_desc:Flags){
    nodes {
      Channel_Name
      Read_End_Time
      Read_Value
      Validation_Status
      Flags
      Fail_Code
      Type
      Status
      rowid
    }
    totalCount
    pageInfo {
      endCursor
      hasNextPage
    }
  }
}
```

## License

Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg