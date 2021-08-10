import 'package:flutter_public_api_getx/app/data/model/covid_statistics.dart';
import 'package:xml/xml.dart';

class DummyData {
  static final dummyXml =
      '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<response>
    <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
    </header>
    <body>
        <items>
            <item>
                <accDefRate>1.8329687619</accDefRate>
                <accExamCnt>12057831</accExamCnt>
                <accExamCompCnt>11590323</accExamCompCnt>
                <careCnt>24080</careCnt>
                <clearCnt>186242</clearCnt>
                <createDt>2021-08-09 09:37:14.335</createDt>
                <deathCnt>2125</deathCnt>
                <decideCnt>212447</decideCnt>
                <examCnt>467508</examCnt>
                <resutlNegCnt>11377876</resutlNegCnt>
                <seq>598</seq>
                <stateDt>20210809</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2021-08-10 09:53:03.24</updateDt>
            </item>
            <item>
                <accDefRate>1.8246951604</accDefRate>
                <accExamCnt>12027443</accExamCnt>
                <accExamCompCnt>11561164</accExamCompCnt>
                <careCnt>23832</careCnt>
                <clearCnt>185003</clearCnt>
                <createDt>2021-08-08 09:43:32.979</createDt>
                <deathCnt>2121</deathCnt>
                <decideCnt>210956</decideCnt>
                <examCnt>466279</examCnt>
                <resutlNegCnt>11350208</resutlNegCnt>
                <seq>597</seq>
                <stateDt>20210808</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.8113424207</accDefRate>
                <accExamCnt>11995928</accExamCnt>
                <accExamCompCnt>11550991</accExamCompCnt>
                <careCnt>23323</careCnt>
                <clearCnt>183789</clearCnt>
                <createDt>2021-08-07 09:40:18.999</createDt>
                <deathCnt>2116</deathCnt>
                <decideCnt>209228</decideCnt>
                <examCnt>444937</examCnt>
                <resutlNegCnt>11341763</resutlNegCnt>
                <seq>596</seq>
                <stateDt>20210807</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.7996718498</accDefRate>
                <accExamCnt>11951651</accExamCnt>
                <accExamCompCnt>11524601</accExamCompCnt>
                <careCnt>23240</careCnt>
                <clearCnt>182052</clearCnt>
                <createDt>2021-08-06 09:43:45.386</createDt>
                <deathCnt>2113</deathCnt>
                <decideCnt>207405</decideCnt>
                <examCnt>427050</examCnt>
                <resutlNegCnt>11317196</resutlNegCnt>
                <seq>595</seq>
                <stateDt>20210806</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2021-08-07 10:18:32.043</updateDt>
            </item>
            <item>
                <accDefRate>1.7898020411</accDefRate>
                <accExamCnt>11908436</accExamCnt>
                <accExamCompCnt>11492947</accExamCompCnt>
                <careCnt>22873</careCnt>
                <clearCnt>180719</clearCnt>
                <createDt>2021-08-05 09:50:52.915</createDt>
                <deathCnt>2109</deathCnt>
                <decideCnt>205701</decideCnt>
                <examCnt>415489</examCnt>
                <resutlNegCnt>11287246</resutlNegCnt>
                <seq>594</seq>
                <stateDt>20210805</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2021-08-07 10:19:32.221</updateDt>
            </item>
            <item>
                <accDefRate>1.7784726028</accDefRate>
                <accExamCnt>11864245</accExamCnt>
                <accExamCompCnt>11466356</accExamCompCnt>
                <careCnt>22697</careCnt>
                <clearCnt>179123</clearCnt>
                <createDt>2021-08-04 09:49:14.864</createDt>
                <deathCnt>2106</deathCnt>
                <decideCnt>203926</decideCnt>
                <examCnt>397889</examCnt>
                <resutlNegCnt>11262430</resutlNegCnt>
                <seq>593</seq>
                <stateDt>20210804</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.7703206768</accDefRate>
                <accExamCnt>11820016</accExamCnt>
                <accExamCompCnt>11421716</accExamCompCnt>
                <careCnt>22188</careCnt>
                <clearCnt>177909</clearCnt>
                <createDt>2021-08-03 09:38:51.531</createDt>
                <deathCnt>2104</deathCnt>
                <decideCnt>202201</decideCnt>
                <examCnt>398300</examCnt>
                <resutlNegCnt>11219515</resutlNegCnt>
                <seq>592</seq>
                <stateDt>20210803</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2021-08-04 09:58:25.377</updateDt>
            </item>
            <item>
                <accDefRate>1.7654223809</accDefRate>
                <accExamCnt>11772604</accExamCnt>
                <accExamCompCnt>11385434</accExamCompCnt>
                <careCnt>22297</careCnt>
                <clearCnt>176605</clearCnt>
                <createDt>2021-08-02 09:37:51.966</createDt>
                <deathCnt>2099</deathCnt>
                <decideCnt>201001</decideCnt>
                <examCnt>387170</examCnt>
                <resutlNegCnt>11184433</resutlNegCnt>
                <seq>591</seq>
                <stateDt>20210802</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>2021-08-03 11:08:09.679</updateDt>
            </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>8</totalCount>
    </body>
</response>''';
}
