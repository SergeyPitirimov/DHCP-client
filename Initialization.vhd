LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Initialization IS
  PORT( clk_cnt_in                        :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        mdc                               :   OUT   std_logic;
        mdio                              :   OUT   std_logic;
        eth_reset_n                       :   OUT   std_logic;
        done                              :   OUT   std_logic;
        clk_cnt_out                       :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
        );
END Initialization;


ARCHITECTURE rtl OF Initialization IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL clk_cnt_in_unsigned              : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL clk_cnt_out_tmp                  : unsigned(15 DOWNTO 0);  -- uint16

BEGIN
  clk_cnt_in_unsigned <= unsigned(clk_cnt_in);

  Initialization_1_output : PROCESS (clk_cnt_in_unsigned)
    VARIABLE guard1 : std_logic;
    VARIABLE guard2 : std_logic;
    VARIABLE guard3 : std_logic;
    VARIABLE cast : signed(31 DOWNTO 0);
    VARIABLE cast_0 : signed(31 DOWNTO 0);
    VARIABLE cast_1 : unsigned(15 DOWNTO 0);
    VARIABLE add_temp : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_2 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_3 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_4 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_5 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_6 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_7 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_8 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_9 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_10 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_11 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_12 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_13 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_14 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_15 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_16 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_17 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_18 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_19 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_20 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_21 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_22 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_23 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_24 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_25 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_26 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_27 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_28 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_29 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_30 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_31 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_32 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_33 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_34 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_35 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_36 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_37 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_38 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_39 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_40 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_41 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_42 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_43 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_44 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_45 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_46 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_47 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_48 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_49 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_50 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_51 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_52 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_53 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_54 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_55 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_56 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_57 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_58 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_59 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_60 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_61 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_62 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_63 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_64 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_65 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_66 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_67 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_68 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_69 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_70 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_71 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_72 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_73 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_74 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_75 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_76 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_77 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_78 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_79 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_80 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_81 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_82 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_83 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_84 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_85 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_86 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_87 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_88 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_89 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_90 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_91 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_92 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_93 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_94 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_95 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_96 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_97 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_98 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_99 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_100 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_101 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_102 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_103 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_104 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_105 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_106 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_107 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_108 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_109 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_110 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_111 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_112 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_113 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_114 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_115 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_116 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_117 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_118 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_119 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_120 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_121 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_122 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_123 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_124 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_125 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_126 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_127 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_128 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_129 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_130 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_131 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_132 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_133 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_134 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_135 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_136 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_137 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_138 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_139 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_140 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_141 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_142 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_143 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_144 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_145 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_146 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_147 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_148 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_149 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_150 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_151 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_152 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_153 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_154 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_155 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_156 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_157 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_158 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_159 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_160 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_161 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_162 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_163 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_164 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_165 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_166 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_167 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_168 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_169 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_170 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_171 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_172 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_173 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_174 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_175 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_176 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_177 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_178 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_179 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_180 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_181 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_182 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_183 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_184 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_185 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_186 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_187 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_188 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_189 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_190 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_191 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_192 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_193 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_194 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_195 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_196 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_197 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_198 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_199 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_200 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_201 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_202 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_203 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_204 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_205 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_206 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_207 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_208 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_209 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_210 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_211 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_212 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_213 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_214 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_215 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_216 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_217 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_218 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_219 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_220 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_221 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_222 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_223 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_224 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_225 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_226 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_227 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_228 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_229 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_230 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_231 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_232 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_233 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_234 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_235 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_236 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_237 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_238 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_239 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_240 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_241 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_242 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_243 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_244 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_245 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_246 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_247 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_248 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_249 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_250 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_251 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_252 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_253 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_254 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_255 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_256 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_257 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_258 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_259 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_260 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_261 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_262 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_263 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_264 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_265 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_266 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_267 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_268 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_269 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_270 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_271 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_272 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_273 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_274 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_275 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_276 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_277 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_278 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_279 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_280 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_281 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_282 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_283 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_284 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_285 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_286 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_287 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_288 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_289 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_290 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_291 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_292 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_293 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_294 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_295 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_296 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_297 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_298 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_299 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_300 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_301 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_302 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_303 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_304 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_305 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_306 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_307 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_308 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_309 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_310 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_311 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_312 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_313 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_314 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_315 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_316 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_317 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_318 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_319 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_320 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_321 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_322 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_323 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_324 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_325 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_326 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_327 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_328 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_329 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_330 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_331 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_332 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_333 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_334 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_335 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_336 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_337 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_338 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_339 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_340 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_341 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_342 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_343 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_344 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_345 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_346 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_347 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_348 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_349 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_350 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_351 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_352 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_353 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_354 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_355 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_356 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_357 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_358 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_359 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_360 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_361 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_362 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_363 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_364 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_365 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_366 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_367 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_368 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_369 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_370 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_371 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_372 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_373 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_374 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_375 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_376 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_377 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_378 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_379 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_380 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_381 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_382 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_383 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_384 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_385 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_386 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_387 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_388 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_389 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_390 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_391 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_392 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_393 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_394 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_395 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_396 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_397 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_398 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_399 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_400 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_401 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_402 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_403 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_404 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_405 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_406 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_407 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_408 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_409 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_410 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_411 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_412 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_413 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_414 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_415 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_416 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_417 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_418 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_419 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_420 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_421 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_422 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_423 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_424 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_425 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_426 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_427 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_428 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_429 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_430 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_431 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_432 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_433 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_434 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_435 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_436 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_437 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_438 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_439 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_440 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_441 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_442 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_443 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_444 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_445 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_446 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_447 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_448 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_449 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_450 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_451 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_452 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_453 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_454 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_455 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_456 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_457 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_458 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_459 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_460 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_461 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_462 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_463 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_464 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_465 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_466 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_467 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_468 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_469 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_470 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_471 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_472 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_473 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_474 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_475 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_476 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_477 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_478 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_479 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_480 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_481 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_482 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_483 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_484 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_485 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_486 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_487 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_488 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_489 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_490 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_491 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_492 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_493 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_494 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_495 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_496 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_497 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_498 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_499 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_500 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_501 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_502 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_503 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_504 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_505 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_506 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_507 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_508 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_509 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_510 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_511 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_512 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_513 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_514 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_515 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_516 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_517 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_518 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_519 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_520 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_521 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_522 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_523 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_524 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_525 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_526 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_527 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_528 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_529 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_530 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_531 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_532 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_533 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_534 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_535 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_536 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_537 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_538 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_539 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_540 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_541 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_542 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_543 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_544 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_545 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_546 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_547 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_548 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_549 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_550 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_551 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_552 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_553 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_554 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_555 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_556 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_557 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_558 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_559 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_560 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_561 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_562 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_563 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_564 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_565 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_566 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_567 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_568 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_569 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_570 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_571 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_572 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_573 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_574 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_575 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_576 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_577 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_578 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_579 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_580 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_581 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_582 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_583 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_584 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_585 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_586 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_587 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_588 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_589 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_590 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_591 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_592 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_593 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_594 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_595 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_596 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_597 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_598 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_599 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_600 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_601 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_602 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_603 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_604 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_605 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_606 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_607 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_608 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_609 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_610 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_611 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_612 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_613 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_614 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_615 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_616 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_617 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_618 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_619 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_620 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_621 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_622 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_623 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_624 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_625 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_626 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_627 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_628 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_629 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_630 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_631 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_632 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_633 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_634 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_635 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_636 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_637 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_638 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_639 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_640 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_641 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_642 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_643 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_644 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_645 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_646 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_647 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_648 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_649 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_650 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_651 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_652 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_653 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_654 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_655 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_656 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_657 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_658 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_659 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_660 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_661 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_662 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_663 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_664 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_665 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_666 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_667 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_668 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_669 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_670 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_671 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_672 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_673 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_674 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_675 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_676 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_677 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_678 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_679 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_680 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_681 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_682 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_683 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_684 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_685 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_686 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_687 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_688 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_689 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_690 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_691 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_692 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_693 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_694 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_695 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_696 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_697 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_698 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_699 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_700 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_701 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_702 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_703 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_704 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_705 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_706 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_707 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_708 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_709 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_710 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_711 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_712 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_713 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_714 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_715 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_716 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_717 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_718 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_719 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_720 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_721 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_722 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_723 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_724 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_725 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_726 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_727 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_728 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_729 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_730 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_731 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_732 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_733 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_734 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_735 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_736 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_737 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_738 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_739 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_740 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_741 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_742 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_743 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_744 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_745 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_746 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_747 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_748 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_749 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_750 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_751 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_752 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_753 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_754 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_755 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_756 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_757 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_758 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_759 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_760 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_761 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_762 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_763 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_764 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_765 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_766 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_767 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_768 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_769 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_770 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_771 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_772 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_773 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_774 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_775 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_776 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_777 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_778 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_779 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_780 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_781 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_782 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_783 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_784 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_785 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_786 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_787 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_788 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_789 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_790 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_791 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_792 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_793 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_794 : unsigned(16 DOWNTO 0);
    VARIABLE add_temp_795 : unsigned(16 DOWNTO 0);
  BEGIN
    -- Management data clock, management data io and ethernet chip reset ports
    guard1 := '0';
    guard2 := '0';
    guard3 := '0';
    CASE clk_cnt_in_unsigned IS
      WHEN "0000000000000000" =>
        guard1 := '1';
      WHEN "0000000000000001" =>
        guard1 := '1';
      WHEN "0000000000000010" =>
        guard1 := '1';
      WHEN "0000000000000011" =>
        guard1 := '1';
      WHEN "0000000000000100" =>
        guard1 := '1';
      WHEN "0000000000000101" =>
        guard1 := '1';
      WHEN "0000000000000110" =>
        guard1 := '1';
      WHEN "0000000000000111" =>
        guard1 := '1';
      WHEN "0000000000001000" =>
        guard1 := '1';
      WHEN "0000000000001001" =>
        guard1 := '1';
      WHEN "0000000000001010" =>
        guard1 := '1';
      WHEN "0000000000001011" =>
        guard1 := '1';
      WHEN "0000000000001100" =>
        guard1 := '1';
      WHEN "0000000000001101" =>
        guard1 := '1';
      WHEN "0000000000001110" =>
        guard1 := '1';
      WHEN "0000000000001111" =>
        guard1 := '1';
      WHEN "0000000000010000" =>
        guard1 := '1';
      WHEN "0000000000010001" =>
        guard1 := '1';
      WHEN "0000000000010010" =>
        guard1 := '1';
      WHEN "0000000000010011" =>
        guard1 := '1';
      WHEN "0000000000010100" =>
        guard1 := '1';
      WHEN "0000000000010101" =>
        guard1 := '1';
      WHEN "0000000000010110" =>
        guard1 := '1';
      WHEN "0000000000010111" =>
        guard1 := '1';
      WHEN "0000000000011000" =>
        guard1 := '1';
      WHEN "0000000000011001" =>
        guard1 := '1';
      WHEN "0000000000011010" =>
        guard1 := '1';
      WHEN "0000000000011011" =>
        guard1 := '1';
      WHEN "0000000000011100" =>
        guard1 := '1';
      WHEN "0000000000011101" =>
        guard1 := '1';
      WHEN "0000000000011110" =>
        guard1 := '1';
      WHEN "0000000000011111" =>
        guard1 := '1';
      WHEN "0000000000100000" =>
        guard1 := '1';
      WHEN "0000000000100001" =>
        guard1 := '1';
      WHEN "0000000000100010" =>
        guard1 := '1';
      WHEN "0000000000100011" =>
        guard1 := '1';
      WHEN "0000000000100100" =>
        guard1 := '1';
      WHEN "0000000000100101" =>
        guard1 := '1';
      WHEN "0000000000100110" =>
        guard1 := '1';
      WHEN "0000000000100111" =>
        guard1 := '1';
      WHEN "0000000000101000" =>
        guard1 := '1';
      WHEN "0000000000101001" =>
        guard1 := '1';
      WHEN "0000000000101010" =>
        guard1 := '1';
      WHEN "0000000000101011" =>
        guard1 := '1';
      WHEN "0000000000101100" =>
        guard1 := '1';
      WHEN "0000000000101101" =>
        guard1 := '1';
      WHEN "0000000000101110" =>
        guard1 := '1';
      WHEN "0000000000101111" =>
        guard1 := '1';
      WHEN "0000000000110000" =>
        guard1 := '1';
      WHEN "0000000000110001" =>
        guard1 := '1';
      WHEN "0000000000110010" =>
        guard2 := '1';
      WHEN "0000000000110011" =>
        guard2 := '1';
      WHEN "0000000000110100" =>
        guard2 := '1';
      WHEN "0000000000110101" =>
        guard2 := '1';
      WHEN "0000000000110110" =>
        guard2 := '1';
      WHEN "0000000000110111" =>
        guard2 := '1';
      WHEN "0000000000111000" =>
        guard2 := '1';
      WHEN "0000000000111001" =>
        guard2 := '1';
      WHEN "0000000000111010" =>
        guard2 := '1';
      WHEN "0000000000111011" =>
        guard2 := '1';
      WHEN "0000000000111100" =>
        guard2 := '1';
      WHEN "0000000000111101" =>
        guard2 := '1';
      WHEN "0000000000111110" =>
        guard2 := '1';
      WHEN "0000000000111111" =>
        guard2 := '1';
      WHEN "0000000001000000" =>
        guard2 := '1';
      WHEN "0000000001000001" =>
        guard2 := '1';
      WHEN "0000000001000010" =>
        guard2 := '1';
      WHEN "0000000001000011" =>
        guard2 := '1';
      WHEN "0000000001000100" =>
        guard2 := '1';
      WHEN "0000000001000101" =>
        guard2 := '1';
      WHEN "0000000001000110" =>
        guard2 := '1';
      WHEN "0000000001000111" =>
        guard2 := '1';
      WHEN "0000000001001000" =>
        guard2 := '1';
      WHEN "0000000001001001" =>
        guard2 := '1';
      WHEN "0000000001001010" =>
        guard2 := '1';
      WHEN "0000000001001011" =>
        guard2 := '1';
      WHEN "0000000001001100" =>
        guard2 := '1';
      WHEN "0000000001001101" =>
        guard2 := '1';
      WHEN "0000000001001110" =>
        guard2 := '1';
      WHEN "0000000001001111" =>
        guard2 := '1';
      WHEN "0000000001010000" =>
        guard2 := '1';
      WHEN "0000000001010001" =>
        guard2 := '1';
      WHEN "0000000001010010" =>
        guard2 := '1';
      WHEN "0000000001010011" =>
        guard2 := '1';
      WHEN "0000000001010100" =>
        guard2 := '1';
      WHEN "0000000001010101" =>
        guard2 := '1';
      WHEN "0000000001010110" =>
        guard2 := '1';
      WHEN "0000000001010111" =>
        guard2 := '1';
      WHEN "0000000001011000" =>
        guard2 := '1';
      WHEN "0000000001011001" =>
        guard2 := '1';
      WHEN "0000000001011010" =>
        guard2 := '1';
      WHEN "0000000001011011" =>
        guard2 := '1';
      WHEN "0000000001011100" =>
        guard2 := '1';
      WHEN "0000000001011101" =>
        guard2 := '1';
      WHEN "0000000001011110" =>
        guard2 := '1';
      WHEN "0000000001011111" =>
        guard2 := '1';
      WHEN "0000000001100000" =>
        guard2 := '1';
      WHEN "0000000001100001" =>
        guard2 := '1';
      WHEN "0000000001100010" =>
        guard2 := '1';
      WHEN "0000000001100011" =>
        guard2 := '1';
      WHEN "0000000001100100" =>
        guard2 := '1';
      WHEN "0000000001100101" =>
        guard2 := '1';
      WHEN "0000000001100110" =>
        guard2 := '1';
      WHEN "0000000001100111" =>
        guard2 := '1';
      WHEN "0000000001101000" =>
        guard2 := '1';
      WHEN "0000000001101001" =>
        guard2 := '1';
      WHEN "0000000001101010" =>
        guard2 := '1';
      WHEN "0000000001101011" =>
        guard2 := '1';
      WHEN "0000000001101100" =>
        guard2 := '1';
      WHEN "0000000001101101" =>
        guard2 := '1';
      WHEN "0000000001101110" =>
        guard2 := '1';
      WHEN "0000000001101111" =>
        guard2 := '1';
      WHEN "0000000001110000" =>
        guard2 := '1';
      WHEN "0000000001110001" =>
        guard2 := '1';
      WHEN "0000000001110010" =>
        guard2 := '1';
      WHEN "0000000001110011" =>
        guard2 := '1';
      WHEN "0000000001110100" =>
        guard2 := '1';
      WHEN "0000000001110101" =>
        guard2 := '1';
      WHEN "0000000001110110" =>
        guard2 := '1';
      WHEN "0000000001110111" =>
        guard2 := '1';
      WHEN "0000000001111000" =>
        guard2 := '1';
      WHEN "0000000001111001" =>
        guard2 := '1';
      WHEN "0000000001111010" =>
        guard2 := '1';
      WHEN "0000000001111011" =>
        guard2 := '1';
      WHEN "0000000001111100" =>
        guard2 := '1';
      WHEN "0000000001111101" =>
        guard2 := '1';
      WHEN "0000000001111110" =>
        guard2 := '1';
      WHEN "0000000001111111" =>
        guard2 := '1';
      WHEN "0000000010000000" =>
        guard2 := '1';
      WHEN "0000000010000001" =>
        guard2 := '1';
      WHEN "0000000010000010" =>
        guard2 := '1';
      WHEN "0000000010000011" =>
        guard2 := '1';
      WHEN "0000000010000100" =>
        guard2 := '1';
      WHEN "0000000010000101" =>
        guard2 := '1';
      WHEN "0000000010000110" =>
        guard2 := '1';
      WHEN "0000000010000111" =>
        guard2 := '1';
      WHEN "0000000010001000" =>
        guard2 := '1';
      WHEN "0000000010001001" =>
        guard2 := '1';
      WHEN "0000000010001010" =>
        guard2 := '1';
      WHEN "0000000010001011" =>
        guard2 := '1';
      WHEN "0000000010001100" =>
        guard2 := '1';
      WHEN "0000000010001101" =>
        guard2 := '1';
      WHEN "0000000010001110" =>
        guard2 := '1';
      WHEN "0000000010001111" =>
        guard2 := '1';
      WHEN "0000000010010000" =>
        guard2 := '1';
      WHEN "0000000010010001" =>
        guard2 := '1';
      WHEN "0000000010010010" =>
        guard2 := '1';
      WHEN "0000000010010011" =>
        guard2 := '1';
      WHEN "0000000010010100" =>
        guard2 := '1';
      WHEN "0000000010010101" =>
        guard2 := '1';
      WHEN "0000000010010110" =>
        guard2 := '1';
      WHEN "0000000010010111" =>
        guard2 := '1';
      WHEN "0000000010011000" =>
        guard2 := '1';
      WHEN "0000000010011001" =>
        guard2 := '1';
      WHEN "0000000010011010" =>
        guard2 := '1';
      WHEN "0000000010011011" =>
        guard2 := '1';
      WHEN "0000000010011100" =>
        guard2 := '1';
      WHEN "0000000010011101" =>
        guard2 := '1';
      WHEN "0000000010011110" =>
        guard2 := '1';
      WHEN "0000000010011111" =>
        guard2 := '1';
      WHEN "0000000010100000" =>
        guard2 := '1';
      WHEN "0000000010100001" =>
        guard2 := '1';
      WHEN "0000000010100010" =>
        guard2 := '1';
      WHEN "0000000010100011" =>
        guard2 := '1';
      WHEN "0000000010100100" =>
        guard2 := '1';
      WHEN "0000000010100101" =>
        guard2 := '1';
      WHEN "0000000010100110" =>
        guard2 := '1';
      WHEN "0000000010100111" =>
        guard2 := '1';
      WHEN "0000000010101000" =>
        guard2 := '1';
      WHEN "0000000010101001" =>
        guard2 := '1';
      WHEN "0000000010101010" =>
        guard2 := '1';
      WHEN "0000000010101011" =>
        guard2 := '1';
      WHEN "0000000010101100" =>
        guard2 := '1';
      WHEN "0000000010101101" =>
        guard2 := '1';
      WHEN "0000000010101110" =>
        guard2 := '1';
      WHEN "0000000010101111" =>
        guard2 := '1';
      WHEN "0000000010110000" =>
        guard2 := '1';
      WHEN "0000000010110001" =>
        guard2 := '1';
      WHEN "0000000010110010" =>
        guard2 := '1';
      WHEN "0000000010110011" =>
        guard2 := '1';
      WHEN "0000000010110100" =>
        guard2 := '1';
      WHEN "0000000010110101" =>
        guard2 := '1';
      WHEN "0000000010110110" =>
        guard2 := '1';
      WHEN "0000000010110111" =>
        guard2 := '1';
      WHEN "0000000010111000" =>
        guard2 := '1';
      WHEN "0000000010111001" =>
        guard2 := '1';
      WHEN "0000000010111010" =>
        guard2 := '1';
      WHEN "0000000010111011" =>
        guard2 := '1';
      WHEN "0000000010111100" =>
        guard2 := '1';
      WHEN "0000000010111101" =>
        guard2 := '1';
      WHEN "0000000010111110" =>
        guard2 := '1';
      WHEN "0000000010111111" =>
        guard2 := '1';
      WHEN "0000000011000000" =>
        guard2 := '1';
      WHEN "0000000011000001" =>
        guard2 := '1';
      WHEN "0000000011000010" =>
        guard2 := '1';
      WHEN "0000000011000011" =>
        guard2 := '1';
      WHEN "0000000011000100" =>
        guard2 := '1';
      WHEN "0000000011000101" =>
        guard2 := '1';
      WHEN "0000000011000110" =>
        guard2 := '1';
      WHEN "0000000011000111" =>
        guard2 := '1';
      WHEN "0000000011001000" =>
        guard3 := '1';
      WHEN "0000000011001001" =>
        guard3 := '1';
      WHEN "0000000011001010" =>
        guard3 := '1';
      WHEN "0000000011001011" =>
        guard3 := '1';
      WHEN "0000000011001100" =>
        guard3 := '1';
      WHEN "0000000011001101" =>
        guard3 := '1';
      WHEN "0000000011001110" =>
        guard3 := '1';
      WHEN "0000000011001111" =>
        guard3 := '1';
      WHEN "0000000011010000" =>
        guard3 := '1';
      WHEN "0000000011010001" =>
        guard3 := '1';
      WHEN "0000000011010010" =>
        guard3 := '1';
      WHEN "0000000011010011" =>
        guard3 := '1';
      WHEN "0000000011010100" =>
        guard3 := '1';
      WHEN "0000000011010101" =>
        guard3 := '1';
      WHEN "0000000011010110" =>
        guard3 := '1';
      WHEN "0000000011010111" =>
        guard3 := '1';
      WHEN "0000000011011000" =>
        guard3 := '1';
      WHEN "0000000011011001" =>
        guard3 := '1';
      WHEN "0000000011011010" =>
        guard3 := '1';
      WHEN "0000000011011011" =>
        guard3 := '1';
      WHEN "0000000011011100" =>
        guard3 := '1';
      WHEN "0000000011011101" =>
        guard3 := '1';
      WHEN "0000000011011110" =>
        guard3 := '1';
      WHEN "0000000011011111" =>
        guard3 := '1';
      WHEN "0000000011100000" =>
        guard3 := '1';
      WHEN "0000000011100001" =>
        guard3 := '1';
      WHEN "0000000011100010" =>
        guard3 := '1';
      WHEN "0000000011100011" =>
        guard3 := '1';
      WHEN "0000000011100100" =>
        guard3 := '1';
      WHEN "0000000011100101" =>
        guard3 := '1';
      WHEN "0000000011100110" =>
        guard3 := '1';
      WHEN "0000000011100111" =>
        guard3 := '1';
      WHEN "0000000011101000" =>
        guard3 := '1';
      WHEN "0000000011101001" =>
        guard3 := '1';
      WHEN "0000000011101010" =>
        guard3 := '1';
      WHEN "0000000011101011" =>
        guard3 := '1';
      WHEN "0000000011101100" =>
        guard3 := '1';
      WHEN "0000000011101101" =>
        guard3 := '1';
      WHEN "0000000011101110" =>
        guard3 := '1';
      WHEN "0000000011101111" =>
        guard3 := '1';
      WHEN "0000000011110000" =>
        guard3 := '1';
      WHEN "0000000011110001" =>
        guard3 := '1';
      WHEN "0000000011110010" =>
        guard3 := '1';
      WHEN "0000000011110011" =>
        guard3 := '1';
      WHEN "0000000011110100" =>
        guard3 := '1';
      WHEN "0000000011110101" =>
        guard3 := '1';
      WHEN "0000000011110110" =>
        guard3 := '1';
      WHEN "0000000011110111" =>
        guard3 := '1';
      WHEN "0000000011111000" =>
        guard3 := '1';
      WHEN "0000000011111001" =>
        guard3 := '1';
      WHEN "0000000011111010" =>
        guard3 := '1';
      WHEN "0000000011111011" =>
        guard3 := '1';
      WHEN "0000000011111100" =>
        guard3 := '1';
      WHEN "0000000011111101" =>
        guard3 := '1';
      WHEN "0000000011111110" =>
        guard3 := '1';
      WHEN "0000000011111111" =>
        guard3 := '1';
      WHEN "0000000100000000" =>
        guard3 := '1';
      WHEN "0000000100000001" =>
        guard3 := '1';
      WHEN "0000000100000010" =>
        guard3 := '1';
      WHEN "0000000100000011" =>
        guard3 := '1';
      WHEN "0000000100000100" =>
        guard3 := '1';
      WHEN "0000000100000101" =>
        guard3 := '1';
      WHEN "0000000100000110" =>
        guard3 := '1';
      WHEN "0000000100000111" =>
        guard3 := '1';
      WHEN "0000000100001000" =>
        guard3 := '1';
      WHEN "0000000100001001" =>
        -- Pause for one clock of MDC, MDIO = 1)
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp(15 DOWNTO 0);
        END IF;
      WHEN "0000000100001010" =>
        -- Pause for one clock of MDC, MDIO = 1)
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_0 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_0(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_0(15 DOWNTO 0);
        END IF;
        -- ---------------- BMCR (address = 0x00, value = 0x2100) ---------------------------  
      WHEN "0000000100001011" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_1 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_1(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_1(15 DOWNTO 0);
        END IF;
      WHEN "0000000100001100" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_2 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_2(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_2(15 DOWNTO 0);
        END IF;
      WHEN "0000000100001101" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_3 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_3(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_3(15 DOWNTO 0);
        END IF;
      WHEN "0000000100001110" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_4 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_4(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_4(15 DOWNTO 0);
        END IF;
      WHEN "0000000100001111" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_5 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_5(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_5(15 DOWNTO 0);
        END IF;
      WHEN "0000000100010000" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_6 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_6(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_6(15 DOWNTO 0);
        END IF;
      WHEN "0000000100010001" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_7 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_7(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_7(15 DOWNTO 0);
        END IF;
      WHEN "0000000100010010" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_8 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_8(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_8(15 DOWNTO 0);
        END IF;
      WHEN "0000000100010011" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_9 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_9(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_9(15 DOWNTO 0);
        END IF;
      WHEN "0000000100010100" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_10 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_10(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_10(15 DOWNTO 0);
        END IF;
      WHEN "0000000100010101" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_11 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_11(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_11(15 DOWNTO 0);
        END IF;
      WHEN "0000000100010110" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_12 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_12(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_12(15 DOWNTO 0);
        END IF;
      WHEN "0000000100010111" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_13 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_13(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_13(15 DOWNTO 0);
        END IF;
      WHEN "0000000100011000" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_14 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_14(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_14(15 DOWNTO 0);
        END IF;
      WHEN "0000000100011001" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_15 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_15(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_15(15 DOWNTO 0);
        END IF;
      WHEN "0000000100011010" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_16 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_16(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_16(15 DOWNTO 0);
        END IF;
      WHEN "0000000100011011" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_17 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_17(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_17(15 DOWNTO 0);
        END IF;
      WHEN "0000000100011100" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_18 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_18(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_18(15 DOWNTO 0);
        END IF;
      WHEN "0000000100011101" =>
        -- BMCR address (0x0), 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_19 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_19(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_19(15 DOWNTO 0);
        END IF;
      WHEN "0000000100011110" =>
        -- BMCR address (0x0), 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_20 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_20(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_20(15 DOWNTO 0);
        END IF;
      WHEN "0000000100011111" =>
        -- BMCR address (0x0), 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_21 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_21(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_21(15 DOWNTO 0);
        END IF;
      WHEN "0000000100100000" =>
        -- BMCR address (0x0), 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_22 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_22(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_22(15 DOWNTO 0);
        END IF;
      WHEN "0000000100100001" =>
        -- BMCR address (0x0), 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_23 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_23(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_23(15 DOWNTO 0);
        END IF;
      WHEN "0000000100100010" =>
        -- BMCR address (0x0), 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_24 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_24(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_24(15 DOWNTO 0);
        END IF;
      WHEN "0000000100100011" =>
        -- BMCR address (0x0), 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_25 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_25(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_25(15 DOWNTO 0);
        END IF;
      WHEN "0000000100100100" =>
        -- BMCR address (0x0), 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_26 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_26(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_26(15 DOWNTO 0);
        END IF;
      WHEN "0000000100100101" =>
        -- BMCR address (0x0), 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_27 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_27(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_27(15 DOWNTO 0);
        END IF;
      WHEN "0000000100100110" =>
        -- BMCR address (0x0), 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_28 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_28(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_28(15 DOWNTO 0);
        END IF;
      WHEN "0000000100100111" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_29 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_29(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_29(15 DOWNTO 0);
        END IF;
      WHEN "0000000100101000" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_30 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_30(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_30(15 DOWNTO 0);
        END IF;
      WHEN "0000000100101001" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_31 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_31(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_31(15 DOWNTO 0);
        END IF;
      WHEN "0000000100101010" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_32 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_32(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_32(15 DOWNTO 0);
        END IF;
      WHEN "0000000100101011" =>
        -- BMCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_33 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_33(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_33(15 DOWNTO 0);
        END IF;
      WHEN "0000000100101100" =>
        -- BMCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_34 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_34(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_34(15 DOWNTO 0);
        END IF;
      WHEN "0000000100101101" =>
        -- BMCR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_35 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_35(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_35(15 DOWNTO 0);
        END IF;
      WHEN "0000000100101110" =>
        -- BMCR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_36 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_36(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_36(15 DOWNTO 0);
        END IF;
      WHEN "0000000100101111" =>
        -- BMCR data, 13th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_37 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_37(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_37(15 DOWNTO 0);
        END IF;
      WHEN "0000000100110000" =>
        -- BMCR data, 13th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_38 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_38(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_38(15 DOWNTO 0);
        END IF;
      WHEN "0000000100110001" =>
        -- BMCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_39 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_39(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_39(15 DOWNTO 0);
        END IF;
      WHEN "0000000100110010" =>
        -- BMCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_40 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_40(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_40(15 DOWNTO 0);
        END IF;
      WHEN "0000000100110011" =>
        -- BMCR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_41 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_41(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_41(15 DOWNTO 0);
        END IF;
      WHEN "0000000100110100" =>
        -- BMCR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_42 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_42(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_42(15 DOWNTO 0);
        END IF;
      WHEN "0000000100110101" =>
        -- BMCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_43 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_43(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_43(15 DOWNTO 0);
        END IF;
      WHEN "0000000100110110" =>
        -- BMCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_44 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_44(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_44(15 DOWNTO 0);
        END IF;
      WHEN "0000000100110111" =>
        -- BMCR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_45 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_45(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_45(15 DOWNTO 0);
        END IF;
      WHEN "0000000100111000" =>
        -- BMCR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_46 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_46(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_46(15 DOWNTO 0);
        END IF;
      WHEN "0000000100111001" =>
        -- BMCR data, 8th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_47 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_47(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_47(15 DOWNTO 0);
        END IF;
      WHEN "0000000100111010" =>
        -- BMCR data, 8th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_48 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_48(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_48(15 DOWNTO 0);
        END IF;
      WHEN "0000000100111011" =>
        -- BMCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_49 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_49(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_49(15 DOWNTO 0);
        END IF;
      WHEN "0000000100111100" =>
        -- BMCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_50 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_50(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_50(15 DOWNTO 0);
        END IF;
      WHEN "0000000100111101" =>
        -- BMCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_51 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_51(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_51(15 DOWNTO 0);
        END IF;
      WHEN "0000000100111110" =>
        -- BMCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_52 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_52(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_52(15 DOWNTO 0);
        END IF;
      WHEN "0000000100111111" =>
        -- BMCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_53 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_53(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_53(15 DOWNTO 0);
        END IF;
      WHEN "0000000101000000" =>
        -- BMCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_54 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_54(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_54(15 DOWNTO 0);
        END IF;
      WHEN "0000000101000001" =>
        -- BMCR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_55 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_55(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_55(15 DOWNTO 0);
        END IF;
      WHEN "0000000101000010" =>
        -- BMCR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_56 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_56(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_56(15 DOWNTO 0);
        END IF;
      WHEN "0000000101000011" =>
        -- BMCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_57 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_57(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_57(15 DOWNTO 0);
        END IF;
      WHEN "0000000101000100" =>
        -- BMCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_58 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_58(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_58(15 DOWNTO 0);
        END IF;
      WHEN "0000000101000101" =>
        -- BMCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_59 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_59(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_59(15 DOWNTO 0);
        END IF;
      WHEN "0000000101000110" =>
        -- BMCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_60 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_60(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_60(15 DOWNTO 0);
        END IF;
      WHEN "0000000101000111" =>
        -- BMCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_61 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_61(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_61(15 DOWNTO 0);
        END IF;
      WHEN "0000000101001000" =>
        -- BMCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_62 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_62(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_62(15 DOWNTO 0);
        END IF;
      WHEN "0000000101001001" =>
        -- BMCR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_63 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_63(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_63(15 DOWNTO 0);
        END IF;
      WHEN "0000000101001010" =>
        -- BMCR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_64 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_64(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_64(15 DOWNTO 0);
        END IF;
      WHEN "0000000101001011" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_65 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_65(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_65(15 DOWNTO 0);
        END IF;
      WHEN "0000000101001100" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_66 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_66(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_66(15 DOWNTO 0);
        END IF;
        -- ---------------- ANAR (address = 0x04, value = 0x0101) ---------------------------  
      WHEN "0000000101001101" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_67 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_67(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_67(15 DOWNTO 0);
        END IF;
      WHEN "0000000101001110" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_68 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_68(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_68(15 DOWNTO 0);
        END IF;
      WHEN "0000000101001111" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_69 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_69(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_69(15 DOWNTO 0);
        END IF;
      WHEN "0000000101010000" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_70 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_70(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_70(15 DOWNTO 0);
        END IF;
      WHEN "0000000101010001" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_71 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_71(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_71(15 DOWNTO 0);
        END IF;
      WHEN "0000000101010010" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_72 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_72(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_72(15 DOWNTO 0);
        END IF;
      WHEN "0000000101010011" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_73 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_73(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_73(15 DOWNTO 0);
        END IF;
      WHEN "0000000101010100" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_74 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_74(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_74(15 DOWNTO 0);
        END IF;
      WHEN "0000000101010101" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_75 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_75(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_75(15 DOWNTO 0);
        END IF;
      WHEN "0000000101010110" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_76 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_76(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_76(15 DOWNTO 0);
        END IF;
      WHEN "0000000101010111" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_77 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_77(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_77(15 DOWNTO 0);
        END IF;
      WHEN "0000000101011000" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_78 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_78(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_78(15 DOWNTO 0);
        END IF;
      WHEN "0000000101011001" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_79 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_79(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_79(15 DOWNTO 0);
        END IF;
      WHEN "0000000101011010" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_80 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_80(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_80(15 DOWNTO 0);
        END IF;
      WHEN "0000000101011011" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_81 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_81(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_81(15 DOWNTO 0);
        END IF;
      WHEN "0000000101011100" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_82 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_82(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_82(15 DOWNTO 0);
        END IF;
      WHEN "0000000101011101" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_83 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_83(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_83(15 DOWNTO 0);
        END IF;
      WHEN "0000000101011110" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_84 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_84(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_84(15 DOWNTO 0);
        END IF;
      WHEN "0000000101011111" =>
        -- ANAR address (0x04), 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_85 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_85(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_85(15 DOWNTO 0);
        END IF;
      WHEN "0000000101100000" =>
        -- ANAR address (0x04), 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_86 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_86(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_86(15 DOWNTO 0);
        END IF;
      WHEN "0000000101100001" =>
        -- ANAR address (0x04), 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_87 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_87(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_87(15 DOWNTO 0);
        END IF;
      WHEN "0000000101100010" =>
        -- ANAR address (0x04), 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_88 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_88(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_88(15 DOWNTO 0);
        END IF;
      WHEN "0000000101100011" =>
        -- ANAR address (0x04), 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_89 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_89(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_89(15 DOWNTO 0);
        END IF;
      WHEN "0000000101100100" =>
        -- ANAR address (0x04), 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_90 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_90(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_90(15 DOWNTO 0);
        END IF;
      WHEN "0000000101100101" =>
        -- ANAR address (0x04), 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_91 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_91(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_91(15 DOWNTO 0);
        END IF;
      WHEN "0000000101100110" =>
        -- ANAR address (0x04), 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_92 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_92(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_92(15 DOWNTO 0);
        END IF;
      WHEN "0000000101100111" =>
        -- ANAR address (0x04), 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_93 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_93(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_93(15 DOWNTO 0);
        END IF;
      WHEN "0000000101101000" =>
        -- ANAR address (0x04), 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_94 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_94(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_94(15 DOWNTO 0);
        END IF;
      WHEN "0000000101101001" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_95 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_95(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_95(15 DOWNTO 0);
        END IF;
      WHEN "0000000101101010" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_96 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_96(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_96(15 DOWNTO 0);
        END IF;
      WHEN "0000000101101011" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_97 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_97(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_97(15 DOWNTO 0);
        END IF;
      WHEN "0000000101101100" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_98 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_98(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_98(15 DOWNTO 0);
        END IF;
      WHEN "0000000101101101" =>
        -- ANAR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_99 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_99(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_99(15 DOWNTO 0);
        END IF;
      WHEN "0000000101101110" =>
        -- ANAR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_100 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_100(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_100(15 DOWNTO 0);
        END IF;
      WHEN "0000000101101111" =>
        -- ANAR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_101 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_101(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_101(15 DOWNTO 0);
        END IF;
      WHEN "0000000101110000" =>
        -- ANAR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_102 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_102(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_102(15 DOWNTO 0);
        END IF;
      WHEN "0000000101110001" =>
        -- ANAR data, 13th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_103 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_103(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_103(15 DOWNTO 0);
        END IF;
      WHEN "0000000101110010" =>
        -- ANAR data, 13th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_104 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_104(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_104(15 DOWNTO 0);
        END IF;
      WHEN "0000000101110011" =>
        -- ANAR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_105 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_105(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_105(15 DOWNTO 0);
        END IF;
      WHEN "0000000101110100" =>
        -- ANAR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_106 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_106(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_106(15 DOWNTO 0);
        END IF;
      WHEN "0000000101110101" =>
        -- ANAR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_107 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_107(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_107(15 DOWNTO 0);
        END IF;
      WHEN "0000000101110110" =>
        -- ANAR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_108 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_108(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_108(15 DOWNTO 0);
        END IF;
      WHEN "0000000101110111" =>
        -- ANAR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_109 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_109(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_109(15 DOWNTO 0);
        END IF;
      WHEN "0000000101111000" =>
        -- ANAR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_110 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_110(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_110(15 DOWNTO 0);
        END IF;
      WHEN "0000000101111001" =>
        -- ANAR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_111 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_111(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_111(15 DOWNTO 0);
        END IF;
      WHEN "0000000101111010" =>
        -- ANAR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_112 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_112(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_112(15 DOWNTO 0);
        END IF;
      WHEN "0000000101111011" =>
        -- ANAR data, 8th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_113 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_113(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_113(15 DOWNTO 0);
        END IF;
      WHEN "0000000101111100" =>
        -- ANAR data, 8th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_114 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_114(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_114(15 DOWNTO 0);
        END IF;
      WHEN "0000000101111101" =>
        -- ANAR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_115 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_115(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_115(15 DOWNTO 0);
        END IF;
      WHEN "0000000101111110" =>
        -- ANAR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_116 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_116(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_116(15 DOWNTO 0);
        END IF;
      WHEN "0000000101111111" =>
        -- ANAR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_117 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_117(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_117(15 DOWNTO 0);
        END IF;
      WHEN "0000000110000000" =>
        -- ANAR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_118 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_118(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_118(15 DOWNTO 0);
        END IF;
      WHEN "0000000110000001" =>
        -- ANAR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_119 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_119(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_119(15 DOWNTO 0);
        END IF;
      WHEN "0000000110000010" =>
        -- ANAR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_120 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_120(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_120(15 DOWNTO 0);
        END IF;
      WHEN "0000000110000011" =>
        -- ANAR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_121 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_121(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_121(15 DOWNTO 0);
        END IF;
      WHEN "0000000110000100" =>
        -- ANAR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_122 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_122(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_122(15 DOWNTO 0);
        END IF;
      WHEN "0000000110000101" =>
        -- ANAR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_123 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_123(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_123(15 DOWNTO 0);
        END IF;
      WHEN "0000000110000110" =>
        -- ANAR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_124 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_124(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_124(15 DOWNTO 0);
        END IF;
      WHEN "0000000110000111" =>
        -- ANAR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_125 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_125(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_125(15 DOWNTO 0);
        END IF;
      WHEN "0000000110001000" =>
        -- ANAR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_126 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_126(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_126(15 DOWNTO 0);
        END IF;
      WHEN "0000000110001001" =>
        -- ANAR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_127 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_127(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_127(15 DOWNTO 0);
        END IF;
      WHEN "0000000110001010" =>
        -- ANAR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_128 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_128(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_128(15 DOWNTO 0);
        END IF;
      WHEN "0000000110001011" =>
        -- ANAR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_129 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_129(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_129(15 DOWNTO 0);
        END IF;
      WHEN "0000000110001100" =>
        -- ANAR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_130 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_130(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_130(15 DOWNTO 0);
        END IF;
      WHEN "0000000110001101" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_131 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_131(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_131(15 DOWNTO 0);
        END IF;
      WHEN "0000000110001110" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_132 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_132(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_132(15 DOWNTO 0);
        END IF;
        -- ---------------- ANNPTR (address = 0x7, value = 0x2001) -------------------------  
      WHEN "0000000110001111" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_133 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_133(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_133(15 DOWNTO 0);
        END IF;
      WHEN "0000000110010000" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_134 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_134(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_134(15 DOWNTO 0);
        END IF;
      WHEN "0000000110010001" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_135 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_135(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_135(15 DOWNTO 0);
        END IF;
      WHEN "0000000110010010" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_136 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_136(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_136(15 DOWNTO 0);
        END IF;
      WHEN "0000000110010011" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_137 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_137(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_137(15 DOWNTO 0);
        END IF;
      WHEN "0000000110010100" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_138 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_138(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_138(15 DOWNTO 0);
        END IF;
      WHEN "0000000110010101" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_139 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_139(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_139(15 DOWNTO 0);
        END IF;
      WHEN "0000000110010110" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_140 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_140(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_140(15 DOWNTO 0);
        END IF;
      WHEN "0000000110010111" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_141 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_141(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_141(15 DOWNTO 0);
        END IF;
      WHEN "0000000110011000" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_142 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_142(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_142(15 DOWNTO 0);
        END IF;
      WHEN "0000000110011001" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_143 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_143(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_143(15 DOWNTO 0);
        END IF;
      WHEN "0000000110011010" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_144 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_144(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_144(15 DOWNTO 0);
        END IF;
      WHEN "0000000110011011" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_145 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_145(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_145(15 DOWNTO 0);
        END IF;
      WHEN "0000000110011100" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_146 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_146(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_146(15 DOWNTO 0);
        END IF;
      WHEN "0000000110011101" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_147 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_147(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_147(15 DOWNTO 0);
        END IF;
      WHEN "0000000110011110" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_148 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_148(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_148(15 DOWNTO 0);
        END IF;
      WHEN "0000000110011111" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_149 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_149(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_149(15 DOWNTO 0);
        END IF;
      WHEN "0000000110100000" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_150 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_150(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_150(15 DOWNTO 0);
        END IF;
      WHEN "0000000110100001" =>
        -- ANNPTR address (0x07), 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_151 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_151(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_151(15 DOWNTO 0);
        END IF;
      WHEN "0000000110100010" =>
        -- ANNPTR address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_152 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_152(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_152(15 DOWNTO 0);
        END IF;
      WHEN "0000000110100011" =>
        -- ANNPTR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_153 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_153(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_153(15 DOWNTO 0);
        END IF;
      WHEN "0000000110100100" =>
        -- ANNPTR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_154 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_154(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_154(15 DOWNTO 0);
        END IF;
      WHEN "0000000110100101" =>
        -- ANNPTR address, 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_155 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_155(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_155(15 DOWNTO 0);
        END IF;
      WHEN "0000000110100110" =>
        -- ANNPTR address, 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_156 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_156(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_156(15 DOWNTO 0);
        END IF;
      WHEN "0000000110100111" =>
        -- ANNPTR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_157 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_157(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_157(15 DOWNTO 0);
        END IF;
      WHEN "0000000110101000" =>
        -- ANNPTR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_158 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_158(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_158(15 DOWNTO 0);
        END IF;
      WHEN "0000000110101001" =>
        -- ANNPTR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_159 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_159(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_159(15 DOWNTO 0);
        END IF;
      WHEN "0000000110101010" =>
        -- ANNPTR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_160 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_160(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_160(15 DOWNTO 0);
        END IF;
      WHEN "0000000110101011" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_161 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_161(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_161(15 DOWNTO 0);
        END IF;
      WHEN "0000000110101100" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_162 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_162(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_162(15 DOWNTO 0);
        END IF;
      WHEN "0000000110101101" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_163 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_163(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_163(15 DOWNTO 0);
        END IF;
      WHEN "0000000110101110" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_164 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_164(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_164(15 DOWNTO 0);
        END IF;
      WHEN "0000000110101111" =>
        -- ANNPTR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_165 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_165(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_165(15 DOWNTO 0);
        END IF;
      WHEN "0000000110110000" =>
        -- ANNPTR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_166 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_166(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_166(15 DOWNTO 0);
        END IF;
      WHEN "0000000110110001" =>
        -- ANNPTR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_167 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_167(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_167(15 DOWNTO 0);
        END IF;
      WHEN "0000000110110010" =>
        -- ANNPTR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_168 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_168(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_168(15 DOWNTO 0);
        END IF;
      WHEN "0000000110110011" =>
        -- ANNPTR data, 13th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_169 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_169(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_169(15 DOWNTO 0);
        END IF;
      WHEN "0000000110110100" =>
        -- ANNPTR data, 13th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_170 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_170(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_170(15 DOWNTO 0);
        END IF;
      WHEN "0000000110110101" =>
        -- ANNPTR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_171 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_171(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_171(15 DOWNTO 0);
        END IF;
      WHEN "0000000110110110" =>
        -- ANNPTR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_172 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_172(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_172(15 DOWNTO 0);
        END IF;
      WHEN "0000000110110111" =>
        -- ANNPTR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_173 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_173(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_173(15 DOWNTO 0);
        END IF;
      WHEN "0000000110111000" =>
        -- ANNPTR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_174 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_174(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_174(15 DOWNTO 0);
        END IF;
      WHEN "0000000110111001" =>
        -- ANNPTR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_175 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_175(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_175(15 DOWNTO 0);
        END IF;
      WHEN "0000000110111010" =>
        -- ANNPTR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_176 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_176(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_176(15 DOWNTO 0);
        END IF;
      WHEN "0000000110111011" =>
        -- ANNPTR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_177 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_177(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_177(15 DOWNTO 0);
        END IF;
      WHEN "0000000110111100" =>
        -- ANNPTR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_178 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_178(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_178(15 DOWNTO 0);
        END IF;
      WHEN "0000000110111101" =>
        -- ANNPTR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_179 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_179(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_179(15 DOWNTO 0);
        END IF;
      WHEN "0000000110111110" =>
        -- ANNPTR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_180 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_180(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_180(15 DOWNTO 0);
        END IF;
      WHEN "0000000110111111" =>
        -- ANNPTR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_181 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_181(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_181(15 DOWNTO 0);
        END IF;
      WHEN "0000000111000000" =>
        -- ANNPTR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_182 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_182(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_182(15 DOWNTO 0);
        END IF;
      WHEN "0000000111000001" =>
        -- ANNPTR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_183 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_183(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_183(15 DOWNTO 0);
        END IF;
      WHEN "0000000111000010" =>
        -- ANNPTR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_184 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_184(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_184(15 DOWNTO 0);
        END IF;
      WHEN "0000000111000011" =>
        -- ANNPTR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_185 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_185(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_185(15 DOWNTO 0);
        END IF;
      WHEN "0000000111000100" =>
        -- ANNPTR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_186 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_186(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_186(15 DOWNTO 0);
        END IF;
      WHEN "0000000111000101" =>
        -- ANNPTR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_187 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_187(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_187(15 DOWNTO 0);
        END IF;
      WHEN "0000000111000110" =>
        -- ANNPTR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_188 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_188(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_188(15 DOWNTO 0);
        END IF;
      WHEN "0000000111000111" =>
        -- ANNPTR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_189 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_189(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_189(15 DOWNTO 0);
        END IF;
      WHEN "0000000111001000" =>
        -- ANNPTR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_190 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_190(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_190(15 DOWNTO 0);
        END IF;
      WHEN "0000000111001001" =>
        -- ANNPTR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_191 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_191(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_191(15 DOWNTO 0);
        END IF;
      WHEN "0000000111001010" =>
        -- ANNPTR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_192 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_192(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_192(15 DOWNTO 0);
        END IF;
      WHEN "0000000111001011" =>
        -- ANNPTR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_193 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_193(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_193(15 DOWNTO 0);
        END IF;
      WHEN "0000000111001100" =>
        -- ANNPTR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_194 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_194(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_194(15 DOWNTO 0);
        END IF;
      WHEN "0000000111001101" =>
        -- ANNPTR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_195 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_195(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_195(15 DOWNTO 0);
        END IF;
      WHEN "0000000111001110" =>
        -- ANNPTR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_196 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_196(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_196(15 DOWNTO 0);
        END IF;
      WHEN "0000000111001111" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_197 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_197(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_197(15 DOWNTO 0);
        END IF;
      WHEN "0000000111010000" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_198 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_198(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_198(15 DOWNTO 0);
        END IF;
        -- ---------------- MICR (address = 0x11, value = 0x0) -------------------------  
      WHEN "0000000111010001" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_199 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_199(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_199(15 DOWNTO 0);
        END IF;
      WHEN "0000000111010010" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_200 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_200(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_200(15 DOWNTO 0);
        END IF;
      WHEN "0000000111010011" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_201 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_201(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_201(15 DOWNTO 0);
        END IF;
      WHEN "0000000111010100" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_202 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_202(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_202(15 DOWNTO 0);
        END IF;
      WHEN "0000000111010101" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_203 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_203(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_203(15 DOWNTO 0);
        END IF;
      WHEN "0000000111010110" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_204 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_204(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_204(15 DOWNTO 0);
        END IF;
      WHEN "0000000111010111" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_205 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_205(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_205(15 DOWNTO 0);
        END IF;
      WHEN "0000000111011000" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_206 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_206(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_206(15 DOWNTO 0);
        END IF;
      WHEN "0000000111011001" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_207 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_207(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_207(15 DOWNTO 0);
        END IF;
      WHEN "0000000111011010" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_208 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_208(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_208(15 DOWNTO 0);
        END IF;
      WHEN "0000000111011011" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_209 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_209(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_209(15 DOWNTO 0);
        END IF;
      WHEN "0000000111011100" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_210 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_210(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_210(15 DOWNTO 0);
        END IF;
      WHEN "0000000111011101" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_211 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_211(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_211(15 DOWNTO 0);
        END IF;
      WHEN "0000000111011110" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_212 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_212(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_212(15 DOWNTO 0);
        END IF;
      WHEN "0000000111011111" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_213 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_213(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_213(15 DOWNTO 0);
        END IF;
      WHEN "0000000111100000" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_214 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_214(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_214(15 DOWNTO 0);
        END IF;
      WHEN "0000000111100001" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_215 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_215(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_215(15 DOWNTO 0);
        END IF;
      WHEN "0000000111100010" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_216 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_216(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_216(15 DOWNTO 0);
        END IF;
      WHEN "0000000111100011" =>
        -- MICR address (0x11), 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_217 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_217(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_217(15 DOWNTO 0);
        END IF;
      WHEN "0000000111100100" =>
        -- MICR address, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_218 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_218(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_218(15 DOWNTO 0);
        END IF;
      WHEN "0000000111100101" =>
        -- MICR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_219 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_219(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_219(15 DOWNTO 0);
        END IF;
      WHEN "0000000111100110" =>
        -- MICR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_220 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_220(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_220(15 DOWNTO 0);
        END IF;
      WHEN "0000000111100111" =>
        -- MICR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_221 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_221(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_221(15 DOWNTO 0);
        END IF;
      WHEN "0000000111101000" =>
        -- MICR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_222 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_222(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_222(15 DOWNTO 0);
        END IF;
      WHEN "0000000111101001" =>
        -- MICR address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_223 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_223(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_223(15 DOWNTO 0);
        END IF;
      WHEN "0000000111101010" =>
        -- MICR address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_224 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_224(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_224(15 DOWNTO 0);
        END IF;
      WHEN "0000000111101011" =>
        -- MICR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_225 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_225(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_225(15 DOWNTO 0);
        END IF;
      WHEN "0000000111101100" =>
        -- MICR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_226 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_226(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_226(15 DOWNTO 0);
        END IF;
      WHEN "0000000111101101" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_227 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_227(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_227(15 DOWNTO 0);
        END IF;
      WHEN "0000000111101110" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_228 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_228(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_228(15 DOWNTO 0);
        END IF;
      WHEN "0000000111101111" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_229 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_229(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_229(15 DOWNTO 0);
        END IF;
      WHEN "0000000111110000" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_230 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_230(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_230(15 DOWNTO 0);
        END IF;
      WHEN "0000000111110001" =>
        -- MICR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_231 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_231(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_231(15 DOWNTO 0);
        END IF;
      WHEN "0000000111110010" =>
        -- MICR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_232 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_232(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_232(15 DOWNTO 0);
        END IF;
      WHEN "0000000111110011" =>
        -- MICR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_233 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_233(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_233(15 DOWNTO 0);
        END IF;
      WHEN "0000000111110100" =>
        -- MICR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_234 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_234(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_234(15 DOWNTO 0);
        END IF;
      WHEN "0000000111110101" =>
        -- MICR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_235 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_235(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_235(15 DOWNTO 0);
        END IF;
      WHEN "0000000111110110" =>
        -- MICR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_236 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_236(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_236(15 DOWNTO 0);
        END IF;
      WHEN "0000000111110111" =>
        -- MICR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_237 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_237(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_237(15 DOWNTO 0);
        END IF;
      WHEN "0000000111111000" =>
        -- MICR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_238 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_238(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_238(15 DOWNTO 0);
        END IF;
      WHEN "0000000111111001" =>
        -- MICR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_239 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_239(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_239(15 DOWNTO 0);
        END IF;
      WHEN "0000000111111010" =>
        -- MICR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_240 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_240(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_240(15 DOWNTO 0);
        END IF;
      WHEN "0000000111111011" =>
        -- MICR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_241 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_241(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_241(15 DOWNTO 0);
        END IF;
      WHEN "0000000111111100" =>
        -- MICR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_242 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_242(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_242(15 DOWNTO 0);
        END IF;
      WHEN "0000000111111101" =>
        -- MICR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_243 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_243(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_243(15 DOWNTO 0);
        END IF;
      WHEN "0000000111111110" =>
        -- MICR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_244 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_244(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_244(15 DOWNTO 0);
        END IF;
      WHEN "0000000111111111" =>
        -- MICR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_245 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_245(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_245(15 DOWNTO 0);
        END IF;
      WHEN "0000001000000000" =>
        -- MICR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_246 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_246(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_246(15 DOWNTO 0);
        END IF;
      WHEN "0000001000000001" =>
        -- MICR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_247 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_247(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_247(15 DOWNTO 0);
        END IF;
      WHEN "0000001000000010" =>
        -- MICR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_248 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_248(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_248(15 DOWNTO 0);
        END IF;
      WHEN "0000001000000011" =>
        -- MICR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_249 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_249(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_249(15 DOWNTO 0);
        END IF;
      WHEN "0000001000000100" =>
        -- MICR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_250 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_250(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_250(15 DOWNTO 0);
        END IF;
      WHEN "0000001000000101" =>
        -- MICR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_251 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_251(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_251(15 DOWNTO 0);
        END IF;
      WHEN "0000001000000110" =>
        -- MICR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_252 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_252(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_252(15 DOWNTO 0);
        END IF;
      WHEN "0000001000000111" =>
        -- MICR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_253 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_253(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_253(15 DOWNTO 0);
        END IF;
      WHEN "0000001000001000" =>
        -- MICR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_254 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_254(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_254(15 DOWNTO 0);
        END IF;
      WHEN "0000001000001001" =>
        -- MICR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_255 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_255(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_255(15 DOWNTO 0);
        END IF;
      WHEN "0000001000001010" =>
        -- MICR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_256 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_256(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_256(15 DOWNTO 0);
        END IF;
      WHEN "0000001000001011" =>
        -- MICR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_257 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_257(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_257(15 DOWNTO 0);
        END IF;
      WHEN "0000001000001100" =>
        -- MICR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_258 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_258(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_258(15 DOWNTO 0);
        END IF;
      WHEN "0000001000001101" =>
        -- MICR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_259 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_259(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_259(15 DOWNTO 0);
        END IF;
      WHEN "0000001000001110" =>
        -- MICR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_260 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_260(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_260(15 DOWNTO 0);
        END IF;
      WHEN "0000001000001111" =>
        -- MICR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_261 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_261(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_261(15 DOWNTO 0);
        END IF;
      WHEN "0000001000010000" =>
        -- MICR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_262 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_262(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_262(15 DOWNTO 0);
        END IF;
      WHEN "0000001000010001" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_263 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_263(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_263(15 DOWNTO 0);
        END IF;
      WHEN "0000001000010010" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_264 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_264(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_264(15 DOWNTO 0);
        END IF;
        -- ---------------- MISR (address = 0x12, value = 0x0) -------------------------  
      WHEN "0000001000010011" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_265 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_265(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_265(15 DOWNTO 0);
        END IF;
      WHEN "0000001000010100" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_266 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_266(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_266(15 DOWNTO 0);
        END IF;
      WHEN "0000001000010101" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_267 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_267(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_267(15 DOWNTO 0);
        END IF;
      WHEN "0000001000010110" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_268 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_268(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_268(15 DOWNTO 0);
        END IF;
      WHEN "0000001000010111" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_269 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_269(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_269(15 DOWNTO 0);
        END IF;
      WHEN "0000001000011000" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_270 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_270(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_270(15 DOWNTO 0);
        END IF;
      WHEN "0000001000011001" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_271 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_271(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_271(15 DOWNTO 0);
        END IF;
      WHEN "0000001000011010" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_272 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_272(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_272(15 DOWNTO 0);
        END IF;
      WHEN "0000001000011011" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_273 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_273(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_273(15 DOWNTO 0);
        END IF;
      WHEN "0000001000011100" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_274 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_274(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_274(15 DOWNTO 0);
        END IF;
      WHEN "0000001000011101" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_275 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_275(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_275(15 DOWNTO 0);
        END IF;
      WHEN "0000001000011110" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_276 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_276(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_276(15 DOWNTO 0);
        END IF;
      WHEN "0000001000011111" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_277 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_277(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_277(15 DOWNTO 0);
        END IF;
      WHEN "0000001000100000" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_278 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_278(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_278(15 DOWNTO 0);
        END IF;
      WHEN "0000001000100001" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_279 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_279(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_279(15 DOWNTO 0);
        END IF;
      WHEN "0000001000100010" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_280 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_280(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_280(15 DOWNTO 0);
        END IF;
      WHEN "0000001000100011" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_281 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_281(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_281(15 DOWNTO 0);
        END IF;
      WHEN "0000001000100100" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_282 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_282(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_282(15 DOWNTO 0);
        END IF;
      WHEN "0000001000100101" =>
        -- MISR address (0x12), 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_283 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_283(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_283(15 DOWNTO 0);
        END IF;
      WHEN "0000001000100110" =>
        -- MISR address, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_284 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_284(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_284(15 DOWNTO 0);
        END IF;
      WHEN "0000001000100111" =>
        -- MISR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_285 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_285(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_285(15 DOWNTO 0);
        END IF;
      WHEN "0000001000101000" =>
        -- MISR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_286 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_286(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_286(15 DOWNTO 0);
        END IF;
      WHEN "0000001000101001" =>
        -- MISR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_287 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_287(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_287(15 DOWNTO 0);
        END IF;
      WHEN "0000001000101010" =>
        -- MISR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_288 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_288(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_288(15 DOWNTO 0);
        END IF;
      WHEN "0000001000101011" =>
        -- MISR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_289 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_289(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_289(15 DOWNTO 0);
        END IF;
      WHEN "0000001000101100" =>
        -- MISR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_290 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_290(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_290(15 DOWNTO 0);
        END IF;
      WHEN "0000001000101101" =>
        -- MISR address, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_291 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_291(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_291(15 DOWNTO 0);
        END IF;
      WHEN "0000001000101110" =>
        -- MISR address, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_292 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_292(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_292(15 DOWNTO 0);
        END IF;
      WHEN "0000001000101111" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_293 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_293(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_293(15 DOWNTO 0);
        END IF;
      WHEN "0000001000110000" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_294 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_294(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_294(15 DOWNTO 0);
        END IF;
      WHEN "0000001000110001" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_295 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_295(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_295(15 DOWNTO 0);
        END IF;
      WHEN "0000001000110010" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_296 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_296(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_296(15 DOWNTO 0);
        END IF;
      WHEN "0000001000110011" =>
        -- MISR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_297 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_297(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_297(15 DOWNTO 0);
        END IF;
      WHEN "0000001000110100" =>
        -- MISR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_298 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_298(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_298(15 DOWNTO 0);
        END IF;
      WHEN "0000001000110101" =>
        -- MISR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_299 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_299(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_299(15 DOWNTO 0);
        END IF;
      WHEN "0000001000110110" =>
        -- MISR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_300 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_300(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_300(15 DOWNTO 0);
        END IF;
      WHEN "0000001000110111" =>
        -- MISR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_301 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_301(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_301(15 DOWNTO 0);
        END IF;
      WHEN "0000001000111000" =>
        -- MISR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_302 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_302(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_302(15 DOWNTO 0);
        END IF;
      WHEN "0000001000111001" =>
        -- MISR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_303 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_303(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_303(15 DOWNTO 0);
        END IF;
      WHEN "0000001000111010" =>
        -- MISR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_304 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_304(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_304(15 DOWNTO 0);
        END IF;
      WHEN "0000001000111011" =>
        -- MISR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_305 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_305(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_305(15 DOWNTO 0);
        END IF;
      WHEN "0000001000111100" =>
        -- MISR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_306 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_306(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_306(15 DOWNTO 0);
        END IF;
      WHEN "0000001000111101" =>
        -- MISR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_307 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_307(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_307(15 DOWNTO 0);
        END IF;
      WHEN "0000001000111110" =>
        -- MISR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_308 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_308(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_308(15 DOWNTO 0);
        END IF;
      WHEN "0000001000111111" =>
        -- MISR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_309 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_309(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_309(15 DOWNTO 0);
        END IF;
      WHEN "0000001001000000" =>
        -- MISR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        done <= '0';
        mdio <= '0';
        add_temp_310 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_310(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_310(15 DOWNTO 0);
        END IF;
      WHEN "0000001001000001" =>
        -- MISR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_311 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_311(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_311(15 DOWNTO 0);
        END IF;
      WHEN "0000001001000010" =>
        -- MISR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_312 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_312(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_312(15 DOWNTO 0);
        END IF;
      WHEN "0000001001000011" =>
        -- MISR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_313 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_313(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_313(15 DOWNTO 0);
        END IF;
      WHEN "0000001001000100" =>
        -- MISR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_314 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_314(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_314(15 DOWNTO 0);
        END IF;
      WHEN "0000001001000101" =>
        -- MISR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_315 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_315(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_315(15 DOWNTO 0);
        END IF;
      WHEN "0000001001000110" =>
        -- MISR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_316 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_316(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_316(15 DOWNTO 0);
        END IF;
      WHEN "0000001001000111" =>
        -- MISR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_317 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_317(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_317(15 DOWNTO 0);
        END IF;
      WHEN "0000001001001000" =>
        -- MISR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_318 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_318(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_318(15 DOWNTO 0);
        END IF;
      WHEN "0000001001001001" =>
        -- MISR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_319 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_319(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_319(15 DOWNTO 0);
        END IF;
      WHEN "0000001001001010" =>
        -- MISR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_320 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_320(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_320(15 DOWNTO 0);
        END IF;
      WHEN "0000001001001011" =>
        -- MISR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_321 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_321(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_321(15 DOWNTO 0);
        END IF;
      WHEN "0000001001001100" =>
        -- MISR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_322 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_322(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_322(15 DOWNTO 0);
        END IF;
      WHEN "0000001001001101" =>
        -- MISR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_323 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_323(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_323(15 DOWNTO 0);
        END IF;
      WHEN "0000001001001110" =>
        -- MISR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_324 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_324(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_324(15 DOWNTO 0);
        END IF;
      WHEN "0000001001001111" =>
        -- MISR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_325 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_325(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_325(15 DOWNTO 0);
        END IF;
      WHEN "0000001001010000" =>
        -- MISR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_326 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_326(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_326(15 DOWNTO 0);
        END IF;
      WHEN "0000001001010001" =>
        -- MISR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_327 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_327(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_327(15 DOWNTO 0);
        END IF;
      WHEN "0000001001010010" =>
        -- MISR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_328 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_328(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_328(15 DOWNTO 0);
        END IF;
      WHEN "0000001001010011" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_329 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_329(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_329(15 DOWNTO 0);
        END IF;
      WHEN "0000001001010100" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_330 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_330(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_330(15 DOWNTO 0);
        END IF;
        -- ---------------- PCSR (address = 0x16, value = 0x0100) -------------------------  
      WHEN "0000001001010101" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_331 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_331(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_331(15 DOWNTO 0);
        END IF;
      WHEN "0000001001010110" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_332 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_332(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_332(15 DOWNTO 0);
        END IF;
      WHEN "0000001001010111" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_333 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_333(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_333(15 DOWNTO 0);
        END IF;
      WHEN "0000001001011000" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_334 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_334(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_334(15 DOWNTO 0);
        END IF;
      WHEN "0000001001011001" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_335 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_335(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_335(15 DOWNTO 0);
        END IF;
      WHEN "0000001001011010" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_336 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_336(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_336(15 DOWNTO 0);
        END IF;
      WHEN "0000001001011011" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_337 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_337(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_337(15 DOWNTO 0);
        END IF;
      WHEN "0000001001011100" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_338 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_338(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_338(15 DOWNTO 0);
        END IF;
      WHEN "0000001001011101" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_339 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_339(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_339(15 DOWNTO 0);
        END IF;
      WHEN "0000001001011110" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_340 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_340(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_340(15 DOWNTO 0);
        END IF;
      WHEN "0000001001011111" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_341 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_341(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_341(15 DOWNTO 0);
        END IF;
      WHEN "0000001001100000" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_342 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_342(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_342(15 DOWNTO 0);
        END IF;
      WHEN "0000001001100001" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_343 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_343(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_343(15 DOWNTO 0);
        END IF;
      WHEN "0000001001100010" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_344 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_344(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_344(15 DOWNTO 0);
        END IF;
      WHEN "0000001001100011" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_345 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_345(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_345(15 DOWNTO 0);
        END IF;
      WHEN "0000001001100100" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_346 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_346(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_346(15 DOWNTO 0);
        END IF;
      WHEN "0000001001100101" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_347 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_347(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_347(15 DOWNTO 0);
        END IF;
      WHEN "0000001001100110" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_348 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_348(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_348(15 DOWNTO 0);
        END IF;
      WHEN "0000001001100111" =>
        -- PCSR address (0x16), 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_349 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_349(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_349(15 DOWNTO 0);
        END IF;
      WHEN "0000001001101000" =>
        -- PCSR address, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_350 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_350(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_350(15 DOWNTO 0);
        END IF;
      WHEN "0000001001101001" =>
        -- PCSR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_351 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_351(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_351(15 DOWNTO 0);
        END IF;
      WHEN "0000001001101010" =>
        -- PCSR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_352 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_352(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_352(15 DOWNTO 0);
        END IF;
      WHEN "0000001001101011" =>
        -- PCSR address, 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_353 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_353(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_353(15 DOWNTO 0);
        END IF;
      WHEN "0000001001101100" =>
        -- PCSR address, 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_354 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_354(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_354(15 DOWNTO 0);
        END IF;
      WHEN "0000001001101101" =>
        -- PCSR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_355 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_355(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_355(15 DOWNTO 0);
        END IF;
      WHEN "0000001001101110" =>
        -- PCSR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_356 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_356(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_356(15 DOWNTO 0);
        END IF;
      WHEN "0000001001101111" =>
        -- PCSR address, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_357 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_357(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_357(15 DOWNTO 0);
        END IF;
      WHEN "0000001001110000" =>
        -- PCSR address, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_358 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_358(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_358(15 DOWNTO 0);
        END IF;
      WHEN "0000001001110001" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_359 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_359(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_359(15 DOWNTO 0);
        END IF;
      WHEN "0000001001110010" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_360 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_360(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_360(15 DOWNTO 0);
        END IF;
      WHEN "0000001001110011" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_361 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_361(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_361(15 DOWNTO 0);
        END IF;
      WHEN "0000001001110100" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_362 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_362(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_362(15 DOWNTO 0);
        END IF;
      WHEN "0000001001110101" =>
        -- PCSR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_363 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_363(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_363(15 DOWNTO 0);
        END IF;
      WHEN "0000001001110110" =>
        -- PCSR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_364 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_364(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_364(15 DOWNTO 0);
        END IF;
      WHEN "0000001001110111" =>
        -- PCSR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_365 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_365(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_365(15 DOWNTO 0);
        END IF;
      WHEN "0000001001111000" =>
        -- PCSR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_366 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_366(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_366(15 DOWNTO 0);
        END IF;
      WHEN "0000001001111001" =>
        -- PCSR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_367 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_367(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_367(15 DOWNTO 0);
        END IF;
      WHEN "0000001001111010" =>
        -- PCSR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_368 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_368(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_368(15 DOWNTO 0);
        END IF;
      WHEN "0000001001111011" =>
        -- PCSR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_369 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_369(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_369(15 DOWNTO 0);
        END IF;
      WHEN "0000001001111100" =>
        -- PCSR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_370 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_370(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_370(15 DOWNTO 0);
        END IF;
      WHEN "0000001001111101" =>
        -- PCSR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_371 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_371(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_371(15 DOWNTO 0);
        END IF;
      WHEN "0000001001111110" =>
        -- PCSR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_372 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_372(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_372(15 DOWNTO 0);
        END IF;
      WHEN "0000001001111111" =>
        -- PCSR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_373 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_373(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_373(15 DOWNTO 0);
        END IF;
      WHEN "0000001010000000" =>
        -- PCSR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_374 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_374(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_374(15 DOWNTO 0);
        END IF;
      WHEN "0000001010000001" =>
        -- PCSR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_375 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_375(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_375(15 DOWNTO 0);
        END IF;
      WHEN "0000001010000010" =>
        -- PCSR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_376 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_376(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_376(15 DOWNTO 0);
        END IF;
      WHEN "0000001010000011" =>
        -- PCSR data, 8th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_377 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_377(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_377(15 DOWNTO 0);
        END IF;
      WHEN "0000001010000100" =>
        -- PCSR data, 8th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_378 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_378(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_378(15 DOWNTO 0);
        END IF;
      WHEN "0000001010000101" =>
        -- PCSR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_379 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_379(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_379(15 DOWNTO 0);
        END IF;
      WHEN "0000001010000110" =>
        -- PCSR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_380 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_380(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_380(15 DOWNTO 0);
        END IF;
      WHEN "0000001010000111" =>
        -- PCSR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_381 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_381(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_381(15 DOWNTO 0);
        END IF;
      WHEN "0000001010001000" =>
        -- PCSR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_382 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_382(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_382(15 DOWNTO 0);
        END IF;
      WHEN "0000001010001001" =>
        -- PCSR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_383 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_383(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_383(15 DOWNTO 0);
        END IF;
      WHEN "0000001010001010" =>
        -- PCSR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_384 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_384(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_384(15 DOWNTO 0);
        END IF;
      WHEN "0000001010001011" =>
        -- PCSR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_385 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_385(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_385(15 DOWNTO 0);
        END IF;
      WHEN "0000001010001100" =>
        -- PCSR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_386 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_386(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_386(15 DOWNTO 0);
        END IF;
      WHEN "0000001010001101" =>
        -- PCSR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_387 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_387(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_387(15 DOWNTO 0);
        END IF;
      WHEN "0000001010001110" =>
        -- PCSR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_388 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_388(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_388(15 DOWNTO 0);
        END IF;
      WHEN "0000001010001111" =>
        -- PCSR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_389 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_389(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_389(15 DOWNTO 0);
        END IF;
      WHEN "0000001010010000" =>
        -- PCSR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_390 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_390(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_390(15 DOWNTO 0);
        END IF;
      WHEN "0000001010010001" =>
        -- PCSR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_391 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_391(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_391(15 DOWNTO 0);
        END IF;
      WHEN "0000001010010010" =>
        -- PCSR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_392 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_392(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_392(15 DOWNTO 0);
        END IF;
      WHEN "0000001010010011" =>
        -- PCSR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_393 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_393(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_393(15 DOWNTO 0);
        END IF;
      WHEN "0000001010010100" =>
        -- PCSR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_394 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_394(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_394(15 DOWNTO 0);
        END IF;
      WHEN "0000001010010101" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_395 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_395(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_395(15 DOWNTO 0);
        END IF;
      WHEN "0000001010010110" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_396 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_396(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_396(15 DOWNTO 0);
        END IF;
        -- ---------------- RBR (address = 0x17, value = 0x0001) -------------------------  
      WHEN "0000001010010111" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_397 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_397(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_397(15 DOWNTO 0);
        END IF;
      WHEN "0000001010011000" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_398 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_398(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_398(15 DOWNTO 0);
        END IF;
      WHEN "0000001010011001" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_399 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_399(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_399(15 DOWNTO 0);
        END IF;
      WHEN "0000001010011010" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_400 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_400(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_400(15 DOWNTO 0);
        END IF;
      WHEN "0000001010011011" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_401 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_401(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_401(15 DOWNTO 0);
        END IF;
      WHEN "0000001010011100" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_402 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_402(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_402(15 DOWNTO 0);
        END IF;
      WHEN "0000001010011101" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_403 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_403(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_403(15 DOWNTO 0);
        END IF;
      WHEN "0000001010011110" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_404 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_404(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_404(15 DOWNTO 0);
        END IF;
      WHEN "0000001010011111" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_405 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_405(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_405(15 DOWNTO 0);
        END IF;
      WHEN "0000001010100000" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_406 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_406(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_406(15 DOWNTO 0);
        END IF;
      WHEN "0000001010100001" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_407 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_407(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_407(15 DOWNTO 0);
        END IF;
      WHEN "0000001010100010" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_408 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_408(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_408(15 DOWNTO 0);
        END IF;
      WHEN "0000001010100011" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_409 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_409(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_409(15 DOWNTO 0);
        END IF;
      WHEN "0000001010100100" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_410 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_410(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_410(15 DOWNTO 0);
        END IF;
      WHEN "0000001010100101" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_411 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_411(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_411(15 DOWNTO 0);
        END IF;
      WHEN "0000001010100110" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_412 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_412(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_412(15 DOWNTO 0);
        END IF;
      WHEN "0000001010100111" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_413 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_413(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_413(15 DOWNTO 0);
        END IF;
      WHEN "0000001010101000" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_414 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_414(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_414(15 DOWNTO 0);
        END IF;
      WHEN "0000001010101001" =>
        -- RBR address (0x17), 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_415 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_415(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_415(15 DOWNTO 0);
        END IF;
      WHEN "0000001010101010" =>
        -- RBR address, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_416 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_416(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_416(15 DOWNTO 0);
        END IF;
      WHEN "0000001010101011" =>
        -- RBR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_417 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_417(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_417(15 DOWNTO 0);
        END IF;
      WHEN "0000001010101100" =>
        -- RBR address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_418 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_418(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_418(15 DOWNTO 0);
        END IF;
      WHEN "0000001010101101" =>
        -- RBR address, 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_419 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_419(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_419(15 DOWNTO 0);
        END IF;
      WHEN "0000001010101110" =>
        -- RBR address, 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_420 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_420(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_420(15 DOWNTO 0);
        END IF;
      WHEN "0000001010101111" =>
        -- RBR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_421 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_421(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_421(15 DOWNTO 0);
        END IF;
      WHEN "0000001010110000" =>
        -- RBR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_422 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_422(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_422(15 DOWNTO 0);
        END IF;
      WHEN "0000001010110001" =>
        -- RBR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_423 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_423(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_423(15 DOWNTO 0);
        END IF;
      WHEN "0000001010110010" =>
        -- RBR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_424 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_424(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_424(15 DOWNTO 0);
        END IF;
      WHEN "0000001010110011" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_425 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_425(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_425(15 DOWNTO 0);
        END IF;
      WHEN "0000001010110100" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_426 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_426(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_426(15 DOWNTO 0);
        END IF;
      WHEN "0000001010110101" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_427 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_427(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_427(15 DOWNTO 0);
        END IF;
      WHEN "0000001010110110" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_428 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_428(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_428(15 DOWNTO 0);
        END IF;
      WHEN "0000001010110111" =>
        -- RBR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_429 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_429(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_429(15 DOWNTO 0);
        END IF;
      WHEN "0000001010111000" =>
        -- RBR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_430 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_430(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_430(15 DOWNTO 0);
        END IF;
      WHEN "0000001010111001" =>
        -- RBR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_431 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_431(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_431(15 DOWNTO 0);
        END IF;
      WHEN "0000001010111010" =>
        -- RBR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_432 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_432(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_432(15 DOWNTO 0);
        END IF;
      WHEN "0000001010111011" =>
        -- RBR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_433 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_433(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_433(15 DOWNTO 0);
        END IF;
      WHEN "0000001010111100" =>
        -- RBR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_434 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_434(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_434(15 DOWNTO 0);
        END IF;
      WHEN "0000001010111101" =>
        -- RBR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_435 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_435(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_435(15 DOWNTO 0);
        END IF;
      WHEN "0000001010111110" =>
        -- RBR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_436 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_436(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_436(15 DOWNTO 0);
        END IF;
      WHEN "0000001010111111" =>
        -- RBR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_437 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_437(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_437(15 DOWNTO 0);
        END IF;
      WHEN "0000001011000000" =>
        -- RBR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_438 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_438(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_438(15 DOWNTO 0);
        END IF;
      WHEN "0000001011000001" =>
        -- RBR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_439 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_439(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_439(15 DOWNTO 0);
        END IF;
      WHEN "0000001011000010" =>
        -- RBR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_440 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_440(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_440(15 DOWNTO 0);
        END IF;
      WHEN "0000001011000011" =>
        -- RBR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_441 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_441(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_441(15 DOWNTO 0);
        END IF;
      WHEN "0000001011000100" =>
        -- RBR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_442 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_442(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_442(15 DOWNTO 0);
        END IF;
      WHEN "0000001011000101" =>
        -- RBR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_443 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_443(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_443(15 DOWNTO 0);
        END IF;
      WHEN "0000001011000110" =>
        -- RBR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_444 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_444(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_444(15 DOWNTO 0);
        END IF;
      WHEN "0000001011000111" =>
        -- RBR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_445 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_445(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_445(15 DOWNTO 0);
        END IF;
      WHEN "0000001011001000" =>
        -- RBR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_446 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_446(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_446(15 DOWNTO 0);
        END IF;
      WHEN "0000001011001001" =>
        -- RBR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_447 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_447(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_447(15 DOWNTO 0);
        END IF;
      WHEN "0000001011001010" =>
        -- RBR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_448 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_448(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_448(15 DOWNTO 0);
        END IF;
      WHEN "0000001011001011" =>
        -- RBR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_449 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_449(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_449(15 DOWNTO 0);
        END IF;
      WHEN "0000001011001100" =>
        -- RBR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_450 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_450(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_450(15 DOWNTO 0);
        END IF;
      WHEN "0000001011001101" =>
        -- RBR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_451 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_451(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_451(15 DOWNTO 0);
        END IF;
      WHEN "0000001011001110" =>
        -- RBR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_452 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_452(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_452(15 DOWNTO 0);
        END IF;
      WHEN "0000001011001111" =>
        -- RBR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_453 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_453(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_453(15 DOWNTO 0);
        END IF;
      WHEN "0000001011010000" =>
        -- RBR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_454 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_454(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_454(15 DOWNTO 0);
        END IF;
      WHEN "0000001011010001" =>
        -- RBR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_455 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_455(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_455(15 DOWNTO 0);
        END IF;
      WHEN "0000001011010010" =>
        -- RBR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_456 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_456(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_456(15 DOWNTO 0);
        END IF;
      WHEN "0000001011010011" =>
        -- RBR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_457 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_457(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_457(15 DOWNTO 0);
        END IF;
      WHEN "0000001011010100" =>
        -- RBR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_458 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_458(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_458(15 DOWNTO 0);
        END IF;
      WHEN "0000001011010101" =>
        -- RBR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_459 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_459(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_459(15 DOWNTO 0);
        END IF;
      WHEN "0000001011010110" =>
        -- RBR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_460 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_460(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_460(15 DOWNTO 0);
        END IF;
      WHEN "0000001011010111" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_461 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_461(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_461(15 DOWNTO 0);
        END IF;
      WHEN "0000001011011000" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_462 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_462(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_462(15 DOWNTO 0);
        END IF;
        -- ---------------- LEDCR (address = 0x18, value = 0x0) ------------------------  
      WHEN "0000001011011001" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_463 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_463(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_463(15 DOWNTO 0);
        END IF;
      WHEN "0000001011011010" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_464 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_464(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_464(15 DOWNTO 0);
        END IF;
      WHEN "0000001011011011" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_465 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_465(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_465(15 DOWNTO 0);
        END IF;
      WHEN "0000001011011100" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_466 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_466(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_466(15 DOWNTO 0);
        END IF;
      WHEN "0000001011011101" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_467 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_467(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_467(15 DOWNTO 0);
        END IF;
      WHEN "0000001011011110" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_468 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_468(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_468(15 DOWNTO 0);
        END IF;
      WHEN "0000001011011111" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_469 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_469(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_469(15 DOWNTO 0);
        END IF;
      WHEN "0000001011100000" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_470 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_470(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_470(15 DOWNTO 0);
        END IF;
      WHEN "0000001011100001" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_471 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_471(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_471(15 DOWNTO 0);
        END IF;
      WHEN "0000001011100010" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_472 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_472(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_472(15 DOWNTO 0);
        END IF;
      WHEN "0000001011100011" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_473 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_473(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_473(15 DOWNTO 0);
        END IF;
      WHEN "0000001011100100" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_474 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_474(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_474(15 DOWNTO 0);
        END IF;
      WHEN "0000001011100101" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_475 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_475(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_475(15 DOWNTO 0);
        END IF;
      WHEN "0000001011100110" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_476 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_476(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_476(15 DOWNTO 0);
        END IF;
      WHEN "0000001011100111" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_477 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_477(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_477(15 DOWNTO 0);
        END IF;
      WHEN "0000001011101000" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_478 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_478(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_478(15 DOWNTO 0);
        END IF;
      WHEN "0000001011101001" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_479 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_479(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_479(15 DOWNTO 0);
        END IF;
      WHEN "0000001011101010" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_480 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_480(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_480(15 DOWNTO 0);
        END IF;
      WHEN "0000001011101011" =>
        -- LEDCR address (0x18), 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_481 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_481(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_481(15 DOWNTO 0);
        END IF;
      WHEN "0000001011101100" =>
        -- LEDCR address, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_482 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_482(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_482(15 DOWNTO 0);
        END IF;
      WHEN "0000001011101101" =>
        -- LEDCR address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_483 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_483(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_483(15 DOWNTO 0);
        END IF;
      WHEN "0000001011101110" =>
        -- LEDCR address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_484 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_484(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_484(15 DOWNTO 0);
        END IF;
      WHEN "0000001011101111" =>
        -- LEDCR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_485 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_485(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_485(15 DOWNTO 0);
        END IF;
      WHEN "0000001011110000" =>
        -- LEDCR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_486 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_486(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_486(15 DOWNTO 0);
        END IF;
      WHEN "0000001011110001" =>
        -- LEDCR address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_487 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_487(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_487(15 DOWNTO 0);
        END IF;
      WHEN "0000001011110010" =>
        -- LEDCR address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_488 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_488(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_488(15 DOWNTO 0);
        END IF;
      WHEN "0000001011110011" =>
        -- LEDCR address, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_489 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_489(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_489(15 DOWNTO 0);
        END IF;
      WHEN "0000001011110100" =>
        -- LEDCR address, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_490 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_490(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_490(15 DOWNTO 0);
        END IF;
      WHEN "0000001011110101" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_491 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_491(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_491(15 DOWNTO 0);
        END IF;
      WHEN "0000001011110110" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_492 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_492(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_492(15 DOWNTO 0);
        END IF;
      WHEN "0000001011110111" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_493 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_493(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_493(15 DOWNTO 0);
        END IF;
      WHEN "0000001011111000" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_494 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_494(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_494(15 DOWNTO 0);
        END IF;
      WHEN "0000001011111001" =>
        -- LEDCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_495 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_495(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_495(15 DOWNTO 0);
        END IF;
      WHEN "0000001011111010" =>
        -- LEDCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_496 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_496(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_496(15 DOWNTO 0);
        END IF;
      WHEN "0000001011111011" =>
        -- LEDCR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_497 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_497(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_497(15 DOWNTO 0);
        END IF;
      WHEN "0000001011111100" =>
        -- LEDCR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_498 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_498(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_498(15 DOWNTO 0);
        END IF;
      WHEN "0000001011111101" =>
        -- LEDCR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_499 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_499(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_499(15 DOWNTO 0);
        END IF;
      WHEN "0000001011111110" =>
        -- LEDCR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_500 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_500(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_500(15 DOWNTO 0);
        END IF;
      WHEN "0000001011111111" =>
        -- LEDCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_501 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_501(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_501(15 DOWNTO 0);
        END IF;
      WHEN "0000001100000000" =>
        -- LEDCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_502 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_502(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_502(15 DOWNTO 0);
        END IF;
      WHEN "0000001100000001" =>
        -- LEDCR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_503 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_503(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_503(15 DOWNTO 0);
        END IF;
      WHEN "0000001100000010" =>
        -- LEDCR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_504 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_504(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_504(15 DOWNTO 0);
        END IF;
      WHEN "0000001100000011" =>
        -- LEDCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_505 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_505(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_505(15 DOWNTO 0);
        END IF;
      WHEN "0000001100000100" =>
        -- LEDCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_506 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_506(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_506(15 DOWNTO 0);
        END IF;
      WHEN "0000001100000101" =>
        -- LEDCR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_507 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_507(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_507(15 DOWNTO 0);
        END IF;
      WHEN "0000001100000110" =>
        -- LEDCR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_508 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_508(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_508(15 DOWNTO 0);
        END IF;
      WHEN "0000001100000111" =>
        -- LEDCR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_509 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_509(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_509(15 DOWNTO 0);
        END IF;
      WHEN "0000001100001000" =>
        -- LEDCR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_510 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_510(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_510(15 DOWNTO 0);
        END IF;
      WHEN "0000001100001001" =>
        -- LEDCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_511 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_511(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_511(15 DOWNTO 0);
        END IF;
      WHEN "0000001100001010" =>
        -- LEDCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_512 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_512(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_512(15 DOWNTO 0);
        END IF;
      WHEN "0000001100001011" =>
        -- LEDCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_513 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_513(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_513(15 DOWNTO 0);
        END IF;
      WHEN "0000001100001100" =>
        -- LEDCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_514 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_514(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_514(15 DOWNTO 0);
        END IF;
      WHEN "0000001100001101" =>
        -- LEDCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_515 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_515(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_515(15 DOWNTO 0);
        END IF;
      WHEN "0000001100001110" =>
        -- LEDCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_516 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_516(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_516(15 DOWNTO 0);
        END IF;
      WHEN "0000001100001111" =>
        -- LEDCR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_517 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_517(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_517(15 DOWNTO 0);
        END IF;
      WHEN "0000001100010000" =>
        -- LEDCR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_518 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_518(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_518(15 DOWNTO 0);
        END IF;
      WHEN "0000001100010001" =>
        -- LEDCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_519 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_519(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_519(15 DOWNTO 0);
        END IF;
      WHEN "0000001100010010" =>
        -- LEDCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_520 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_520(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_520(15 DOWNTO 0);
        END IF;
      WHEN "0000001100010011" =>
        -- LEDCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_521 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_521(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_521(15 DOWNTO 0);
        END IF;
      WHEN "0000001100010100" =>
        -- LEDCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_522 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_522(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_522(15 DOWNTO 0);
        END IF;
      WHEN "0000001100010101" =>
        -- LEDCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_523 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_523(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_523(15 DOWNTO 0);
        END IF;
      WHEN "0000001100010110" =>
        -- LEDCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_524 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_524(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_524(15 DOWNTO 0);
        END IF;
      WHEN "0000001100010111" =>
        -- LEDCR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_525 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_525(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_525(15 DOWNTO 0);
        END IF;
      WHEN "0000001100011000" =>
        -- LEDCR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_526 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_526(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_526(15 DOWNTO 0);
        END IF;
      WHEN "0000001100011001" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_527 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_527(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_527(15 DOWNTO 0);
        END IF;
      WHEN "0000001100011010" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_528 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_528(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_528(15 DOWNTO 0);
        END IF;
        -- ---------------- PHYCR (address = 0x19, value = 0x0201) ------------------------  
      WHEN "0000001100011011" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_529 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_529(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_529(15 DOWNTO 0);
        END IF;
      WHEN "0000001100011100" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_530 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_530(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_530(15 DOWNTO 0);
        END IF;
      WHEN "0000001100011101" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_531 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_531(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_531(15 DOWNTO 0);
        END IF;
      WHEN "0000001100011110" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_532 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_532(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_532(15 DOWNTO 0);
        END IF;
      WHEN "0000001100011111" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_533 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_533(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_533(15 DOWNTO 0);
        END IF;
      WHEN "0000001100100000" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_534 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_534(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_534(15 DOWNTO 0);
        END IF;
      WHEN "0000001100100001" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_535 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_535(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_535(15 DOWNTO 0);
        END IF;
      WHEN "0000001100100010" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_536 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_536(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_536(15 DOWNTO 0);
        END IF;
      WHEN "0000001100100011" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_537 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_537(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_537(15 DOWNTO 0);
        END IF;
      WHEN "0000001100100100" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_538 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_538(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_538(15 DOWNTO 0);
        END IF;
      WHEN "0000001100100101" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_539 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_539(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_539(15 DOWNTO 0);
        END IF;
      WHEN "0000001100100110" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_540 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_540(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_540(15 DOWNTO 0);
        END IF;
      WHEN "0000001100100111" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_541 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_541(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_541(15 DOWNTO 0);
        END IF;
      WHEN "0000001100101000" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_542 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_542(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_542(15 DOWNTO 0);
        END IF;
      WHEN "0000001100101001" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_543 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_543(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_543(15 DOWNTO 0);
        END IF;
      WHEN "0000001100101010" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_544 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_544(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_544(15 DOWNTO 0);
        END IF;
      WHEN "0000001100101011" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_545 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_545(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_545(15 DOWNTO 0);
        END IF;
      WHEN "0000001100101100" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_546 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_546(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_546(15 DOWNTO 0);
        END IF;
      WHEN "0000001100101101" =>
        -- PHYCR address (0x19), 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_547 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_547(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_547(15 DOWNTO 0);
        END IF;
      WHEN "0000001100101110" =>
        -- PHYCR address, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_548 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_548(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_548(15 DOWNTO 0);
        END IF;
      WHEN "0000001100101111" =>
        -- PHYCR address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_549 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_549(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_549(15 DOWNTO 0);
        END IF;
      WHEN "0000001100110000" =>
        -- PHYCR address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_550 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_550(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_550(15 DOWNTO 0);
        END IF;
      WHEN "0000001100110001" =>
        -- PHYCR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_551 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_551(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_551(15 DOWNTO 0);
        END IF;
      WHEN "0000001100110010" =>
        -- PHYCR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_552 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_552(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_552(15 DOWNTO 0);
        END IF;
      WHEN "0000001100110011" =>
        -- PHYCR address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_553 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_553(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_553(15 DOWNTO 0);
        END IF;
      WHEN "0000001100110100" =>
        -- PHYCR address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_554 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_554(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_554(15 DOWNTO 0);
        END IF;
      WHEN "0000001100110101" =>
        -- PHYCR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_555 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_555(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_555(15 DOWNTO 0);
        END IF;
      WHEN "0000001100110110" =>
        -- PHYCR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_556 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_556(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_556(15 DOWNTO 0);
        END IF;
      WHEN "0000001100110111" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_557 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_557(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_557(15 DOWNTO 0);
        END IF;
      WHEN "0000001100111000" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_558 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_558(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_558(15 DOWNTO 0);
        END IF;
      WHEN "0000001100111001" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_559 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_559(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_559(15 DOWNTO 0);
        END IF;
      WHEN "0000001100111010" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_560 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_560(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_560(15 DOWNTO 0);
        END IF;
      WHEN "0000001100111011" =>
        -- PHYCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_561 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_561(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_561(15 DOWNTO 0);
        END IF;
      WHEN "0000001100111100" =>
        -- PHYCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_562 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_562(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_562(15 DOWNTO 0);
        END IF;
      WHEN "0000001100111101" =>
        -- PHYCR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_563 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_563(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_563(15 DOWNTO 0);
        END IF;
      WHEN "0000001100111110" =>
        -- PHYCR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_564 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_564(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_564(15 DOWNTO 0);
        END IF;
      WHEN "0000001100111111" =>
        -- PHYCR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_565 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_565(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_565(15 DOWNTO 0);
        END IF;
      WHEN "0000001101000000" =>
        -- PHYCR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_566 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_566(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_566(15 DOWNTO 0);
        END IF;
      WHEN "0000001101000001" =>
        -- PHYCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_567 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_567(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_567(15 DOWNTO 0);
        END IF;
      WHEN "0000001101000010" =>
        -- PHYCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_568 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_568(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_568(15 DOWNTO 0);
        END IF;
      WHEN "0000001101000011" =>
        -- PHYCR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_569 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_569(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_569(15 DOWNTO 0);
        END IF;
      WHEN "0000001101000100" =>
        -- PHYCR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_570 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_570(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_570(15 DOWNTO 0);
        END IF;
      WHEN "0000001101000101" =>
        -- PHYCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_571 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_571(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_571(15 DOWNTO 0);
        END IF;
      WHEN "0000001101000110" =>
        -- PHYCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_572 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_572(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_572(15 DOWNTO 0);
        END IF;
      WHEN "0000001101000111" =>
        -- PHYCR data, 9th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_573 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_573(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_573(15 DOWNTO 0);
        END IF;
      WHEN "0000001101001000" =>
        -- PHYCR data, 9th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_574 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_574(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_574(15 DOWNTO 0);
        END IF;
      WHEN "0000001101001001" =>
        -- PHYCR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_575 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_575(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_575(15 DOWNTO 0);
        END IF;
      WHEN "0000001101001010" =>
        -- PHYCR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_576 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_576(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_576(15 DOWNTO 0);
        END IF;
      WHEN "0000001101001011" =>
        -- PHYCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_577 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_577(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_577(15 DOWNTO 0);
        END IF;
      WHEN "0000001101001100" =>
        -- PHYCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_578 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_578(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_578(15 DOWNTO 0);
        END IF;
      WHEN "0000001101001101" =>
        -- PHYCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_579 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_579(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_579(15 DOWNTO 0);
        END IF;
      WHEN "0000001101001110" =>
        -- PHYCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_580 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_580(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_580(15 DOWNTO 0);
        END IF;
      WHEN "0000001101001111" =>
        -- PHYCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_581 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_581(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_581(15 DOWNTO 0);
        END IF;
      WHEN "0000001101010000" =>
        -- PHYCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_582 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_582(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_582(15 DOWNTO 0);
        END IF;
      WHEN "0000001101010001" =>
        -- PHYCR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_583 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_583(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_583(15 DOWNTO 0);
        END IF;
      WHEN "0000001101010010" =>
        -- PHYCR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_584 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_584(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_584(15 DOWNTO 0);
        END IF;
      WHEN "0000001101010011" =>
        -- PHYCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_585 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_585(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_585(15 DOWNTO 0);
        END IF;
      WHEN "0000001101010100" =>
        -- PHYCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_586 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_586(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_586(15 DOWNTO 0);
        END IF;
      WHEN "0000001101010101" =>
        -- PHYCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_587 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_587(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_587(15 DOWNTO 0);
        END IF;
      WHEN "0000001101010110" =>
        -- PHYCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_588 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_588(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_588(15 DOWNTO 0);
        END IF;
      WHEN "0000001101010111" =>
        -- PHYCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_589 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_589(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_589(15 DOWNTO 0);
        END IF;
      WHEN "0000001101011000" =>
        -- PHYCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_590 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_590(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_590(15 DOWNTO 0);
        END IF;
      WHEN "0000001101011001" =>
        -- PHYCR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_591 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_591(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_591(15 DOWNTO 0);
        END IF;
      WHEN "0000001101011010" =>
        -- PHYCR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_592 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_592(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_592(15 DOWNTO 0);
        END IF;
      WHEN "0000001101011011" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_593 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_593(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_593(15 DOWNTO 0);
        END IF;
      WHEN "0000001101011100" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_594 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_594(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_594(15 DOWNTO 0);
        END IF;
        -- ---------------- 10BTSCR (address = 0x1A, value = 0x0800) ------------------------  
      WHEN "0000001101011101" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_595 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_595(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_595(15 DOWNTO 0);
        END IF;
      WHEN "0000001101011110" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_596 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_596(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_596(15 DOWNTO 0);
        END IF;
      WHEN "0000001101011111" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_597 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_597(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_597(15 DOWNTO 0);
        END IF;
      WHEN "0000001101100000" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_598 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_598(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_598(15 DOWNTO 0);
        END IF;
      WHEN "0000001101100001" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_599 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_599(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_599(15 DOWNTO 0);
        END IF;
      WHEN "0000001101100010" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_600 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_600(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_600(15 DOWNTO 0);
        END IF;
      WHEN "0000001101100011" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_601 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_601(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_601(15 DOWNTO 0);
        END IF;
      WHEN "0000001101100100" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_602 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_602(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_602(15 DOWNTO 0);
        END IF;
      WHEN "0000001101100101" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_603 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_603(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_603(15 DOWNTO 0);
        END IF;
      WHEN "0000001101100110" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_604 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_604(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_604(15 DOWNTO 0);
        END IF;
      WHEN "0000001101100111" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_605 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_605(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_605(15 DOWNTO 0);
        END IF;
      WHEN "0000001101101000" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_606 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_606(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_606(15 DOWNTO 0);
        END IF;
      WHEN "0000001101101001" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_607 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_607(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_607(15 DOWNTO 0);
        END IF;
      WHEN "0000001101101010" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_608 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_608(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_608(15 DOWNTO 0);
        END IF;
      WHEN "0000001101101011" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_609 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_609(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_609(15 DOWNTO 0);
        END IF;
      WHEN "0000001101101100" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_610 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_610(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_610(15 DOWNTO 0);
        END IF;
      WHEN "0000001101101101" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_611 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_611(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_611(15 DOWNTO 0);
        END IF;
      WHEN "0000001101101110" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_612 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_612(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_612(15 DOWNTO 0);
        END IF;
      WHEN "0000001101101111" =>
        -- 10BTSCR address (0x1A), 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_613 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_613(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_613(15 DOWNTO 0);
        END IF;
      WHEN "0000001101110000" =>
        -- 10BTSCR address, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_614 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_614(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_614(15 DOWNTO 0);
        END IF;
      WHEN "0000001101110001" =>
        -- 10BTSCR address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_615 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_615(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_615(15 DOWNTO 0);
        END IF;
      WHEN "0000001101110010" =>
        -- 10BTSCR address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_616 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_616(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_616(15 DOWNTO 0);
        END IF;
      WHEN "0000001101110011" =>
        -- 10BTSCR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_617 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_617(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_617(15 DOWNTO 0);
        END IF;
      WHEN "0000001101110100" =>
        -- 10BTSCR address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_618 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_618(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_618(15 DOWNTO 0);
        END IF;
      WHEN "0000001101110101" =>
        -- 10BTSCR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_619 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_619(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_619(15 DOWNTO 0);
        END IF;
      WHEN "0000001101110110" =>
        -- 10BTSCR address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_620 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_620(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_620(15 DOWNTO 0);
        END IF;
      WHEN "0000001101110111" =>
        -- 10BTSCR address, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_621 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_621(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_621(15 DOWNTO 0);
        END IF;
      WHEN "0000001101111000" =>
        -- 10BTSCR address, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_622 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_622(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_622(15 DOWNTO 0);
        END IF;
      WHEN "0000001101111001" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_623 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_623(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_623(15 DOWNTO 0);
        END IF;
      WHEN "0000001101111010" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_624 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_624(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_624(15 DOWNTO 0);
        END IF;
      WHEN "0000001101111011" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_625 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_625(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_625(15 DOWNTO 0);
        END IF;
      WHEN "0000001101111100" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_626 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_626(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_626(15 DOWNTO 0);
        END IF;
      WHEN "0000001101111101" =>
        -- 10BTSCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_627 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_627(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_627(15 DOWNTO 0);
        END IF;
      WHEN "0000001101111110" =>
        -- 10BTSCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_628 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_628(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_628(15 DOWNTO 0);
        END IF;
      WHEN "0000001101111111" =>
        -- 10BTSCR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_629 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_629(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_629(15 DOWNTO 0);
        END IF;
      WHEN "0000001110000000" =>
        -- 10BTSCR data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_630 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_630(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_630(15 DOWNTO 0);
        END IF;
      WHEN "0000001110000001" =>
        -- 10BTSCR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_631 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_631(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_631(15 DOWNTO 0);
        END IF;
      WHEN "0000001110000010" =>
        -- 10BTSCR data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_632 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_632(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_632(15 DOWNTO 0);
        END IF;
      WHEN "0000001110000011" =>
        -- 10BTSCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_633 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_633(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_633(15 DOWNTO 0);
        END IF;
      WHEN "0000001110000100" =>
        -- 10BTSCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_634 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_634(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_634(15 DOWNTO 0);
        END IF;
      WHEN "0000001110000101" =>
        -- 10BTSCR data, 11th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_635 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_635(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_635(15 DOWNTO 0);
        END IF;
      WHEN "0000001110000110" =>
        -- 10BTSCR data, 11th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_636 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_636(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_636(15 DOWNTO 0);
        END IF;
      WHEN "0000001110000111" =>
        -- 10BTSCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_637 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_637(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_637(15 DOWNTO 0);
        END IF;
      WHEN "0000001110001000" =>
        -- 10BTSCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_638 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_638(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_638(15 DOWNTO 0);
        END IF;
      WHEN "0000001110001001" =>
        -- 10BTSCR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_639 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_639(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_639(15 DOWNTO 0);
        END IF;
      WHEN "0000001110001010" =>
        -- 10BTSCR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_640 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_640(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_640(15 DOWNTO 0);
        END IF;
      WHEN "0000001110001011" =>
        -- 10BTSCR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_641 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_641(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_641(15 DOWNTO 0);
        END IF;
      WHEN "0000001110001100" =>
        -- 10BTSCR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_642 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_642(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_642(15 DOWNTO 0);
        END IF;
      WHEN "0000001110001101" =>
        -- 10BTSCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_643 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_643(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_643(15 DOWNTO 0);
        END IF;
      WHEN "0000001110001110" =>
        -- 10BTSCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_644 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_644(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_644(15 DOWNTO 0);
        END IF;
      WHEN "0000001110001111" =>
        -- 10BTSCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_645 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_645(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_645(15 DOWNTO 0);
        END IF;
      WHEN "0000001110010000" =>
        -- 10BTSCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_646 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_646(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_646(15 DOWNTO 0);
        END IF;
      WHEN "0000001110010001" =>
        -- 10BTSCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_647 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_647(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_647(15 DOWNTO 0);
        END IF;
      WHEN "0000001110010010" =>
        -- 10BTSCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_648 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_648(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_648(15 DOWNTO 0);
        END IF;
      WHEN "0000001110010011" =>
        -- 10BTSCR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_649 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_649(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_649(15 DOWNTO 0);
        END IF;
      WHEN "0000001110010100" =>
        -- 10BTSCR data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_650 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_650(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_650(15 DOWNTO 0);
        END IF;
      WHEN "0000001110010101" =>
        -- 10BTSCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_651 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_651(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_651(15 DOWNTO 0);
        END IF;
      WHEN "0000001110010110" =>
        -- 10BTSCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_652 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_652(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_652(15 DOWNTO 0);
        END IF;
      WHEN "0000001110010111" =>
        -- 10BTSCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_653 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_653(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_653(15 DOWNTO 0);
        END IF;
      WHEN "0000001110011000" =>
        -- 10BTSCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_654 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_654(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_654(15 DOWNTO 0);
        END IF;
      WHEN "0000001110011001" =>
        -- 10BTSCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_655 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_655(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_655(15 DOWNTO 0);
        END IF;
      WHEN "0000001110011010" =>
        -- 10BTSCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_656 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_656(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_656(15 DOWNTO 0);
        END IF;
      WHEN "0000001110011011" =>
        -- 10BTSCR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_657 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_657(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_657(15 DOWNTO 0);
        END IF;
      WHEN "0000001110011100" =>
        -- 10BTSCR data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_658 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_658(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_658(15 DOWNTO 0);
        END IF;
      WHEN "0000001110011101" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_659 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_659(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_659(15 DOWNTO 0);
        END IF;
      WHEN "0000001110011110" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_660 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_660(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_660(15 DOWNTO 0);
        END IF;
        -- ---------------- CDCTRL1 (address = 0x1B, value = 0x0) ----------------------  
      WHEN "0000001110011111" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_661 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_661(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_661(15 DOWNTO 0);
        END IF;
      WHEN "0000001110100000" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_662 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_662(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_662(15 DOWNTO 0);
        END IF;
      WHEN "0000001110100001" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_663 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_663(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_663(15 DOWNTO 0);
        END IF;
      WHEN "0000001110100010" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_664 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_664(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_664(15 DOWNTO 0);
        END IF;
      WHEN "0000001110100011" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_665 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_665(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_665(15 DOWNTO 0);
        END IF;
      WHEN "0000001110100100" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_666 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_666(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_666(15 DOWNTO 0);
        END IF;
      WHEN "0000001110100101" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_667 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_667(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_667(15 DOWNTO 0);
        END IF;
      WHEN "0000001110100110" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_668 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_668(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_668(15 DOWNTO 0);
        END IF;
      WHEN "0000001110100111" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_669 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_669(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_669(15 DOWNTO 0);
        END IF;
      WHEN "0000001110101000" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_670 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_670(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_670(15 DOWNTO 0);
        END IF;
      WHEN "0000001110101001" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_671 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_671(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_671(15 DOWNTO 0);
        END IF;
      WHEN "0000001110101010" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_672 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_672(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_672(15 DOWNTO 0);
        END IF;
      WHEN "0000001110101011" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_673 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_673(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_673(15 DOWNTO 0);
        END IF;
      WHEN "0000001110101100" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_674 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_674(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_674(15 DOWNTO 0);
        END IF;
      WHEN "0000001110101101" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_675 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_675(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_675(15 DOWNTO 0);
        END IF;
      WHEN "0000001110101110" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_676 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_676(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_676(15 DOWNTO 0);
        END IF;
      WHEN "0000001110101111" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_677 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_677(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_677(15 DOWNTO 0);
        END IF;
      WHEN "0000001110110000" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_678 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_678(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_678(15 DOWNTO 0);
        END IF;
      WHEN "0000001110110001" =>
        -- CDCTRL1 address (0x1B), 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_679 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_679(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_679(15 DOWNTO 0);
        END IF;
      WHEN "0000001110110010" =>
        -- CDCTRL1 address, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_680 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_680(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_680(15 DOWNTO 0);
        END IF;
      WHEN "0000001110110011" =>
        -- CDCTRL1 address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_681 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_681(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_681(15 DOWNTO 0);
        END IF;
      WHEN "0000001110110100" =>
        -- CDCTRL1 address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_682 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_682(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_682(15 DOWNTO 0);
        END IF;
      WHEN "0000001110110101" =>
        -- CDCTRL1 address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_683 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_683(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_683(15 DOWNTO 0);
        END IF;
      WHEN "0000001110110110" =>
        -- CDCTRL1 address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_684 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_684(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_684(15 DOWNTO 0);
        END IF;
      WHEN "0000001110110111" =>
        -- CDCTRL1 address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_685 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_685(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_685(15 DOWNTO 0);
        END IF;
      WHEN "0000001110111000" =>
        -- CDCTRL1 address, 1st bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_686 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_686(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_686(15 DOWNTO 0);
        END IF;
      WHEN "0000001110111001" =>
        -- CDCTRL1 address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_687 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_687(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_687(15 DOWNTO 0);
        END IF;
      WHEN "0000001110111010" =>
        -- CDCTRL1 address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_688 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_688(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_688(15 DOWNTO 0);
        END IF;
      WHEN "0000001110111011" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_689 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_689(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_689(15 DOWNTO 0);
        END IF;
      WHEN "0000001110111100" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_690 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_690(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_690(15 DOWNTO 0);
        END IF;
      WHEN "0000001110111101" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_691 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_691(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_691(15 DOWNTO 0);
        END IF;
      WHEN "0000001110111110" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_692 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_692(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_692(15 DOWNTO 0);
        END IF;
      WHEN "0000001110111111" =>
        -- CDCTRL1 data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_693 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_693(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_693(15 DOWNTO 0);
        END IF;
      WHEN "0000001111000000" =>
        -- CDCTRL1 data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_694 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_694(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_694(15 DOWNTO 0);
        END IF;
      WHEN "0000001111000001" =>
        -- CDCTRL1 data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_695 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_695(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_695(15 DOWNTO 0);
        END IF;
      WHEN "0000001111000010" =>
        -- CDCTRL1 data, 14th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_696 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_696(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_696(15 DOWNTO 0);
        END IF;
      WHEN "0000001111000011" =>
        -- CDCTRL1 data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_697 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_697(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_697(15 DOWNTO 0);
        END IF;
      WHEN "0000001111000100" =>
        -- CDCTRL1 data, 13th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_698 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_698(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_698(15 DOWNTO 0);
        END IF;
      WHEN "0000001111000101" =>
        -- CDCTRL1 data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_699 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_699(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_699(15 DOWNTO 0);
        END IF;
      WHEN "0000001111000110" =>
        -- CDCTRL1 data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_700 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_700(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_700(15 DOWNTO 0);
        END IF;
      WHEN "0000001111000111" =>
        -- CDCTRL1 data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_701 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_701(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_701(15 DOWNTO 0);
        END IF;
      WHEN "0000001111001000" =>
        -- CDCTRL1 data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_702 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_702(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_702(15 DOWNTO 0);
        END IF;
      WHEN "0000001111001001" =>
        -- CDCTRL1 data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_703 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_703(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_703(15 DOWNTO 0);
        END IF;
      WHEN "0000001111001010" =>
        -- CDCTRL1 data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_704 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_704(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_704(15 DOWNTO 0);
        END IF;
      WHEN "0000001111001011" =>
        -- CDCTRL1 data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_705 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_705(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_705(15 DOWNTO 0);
        END IF;
      WHEN "0000001111001100" =>
        -- CDCTRL1 data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_706 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_706(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_706(15 DOWNTO 0);
        END IF;
      WHEN "0000001111001101" =>
        -- CDCTRL1 data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_707 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_707(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_707(15 DOWNTO 0);
        END IF;
      WHEN "0000001111001110" =>
        -- CDCTRL1 data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_708 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_708(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_708(15 DOWNTO 0);
        END IF;
      WHEN "0000001111001111" =>
        -- CDCTRL1 data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_709 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_709(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_709(15 DOWNTO 0);
        END IF;
      WHEN "0000001111010000" =>
        -- CDCTRL1 data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_710 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_710(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_710(15 DOWNTO 0);
        END IF;
      WHEN "0000001111010001" =>
        -- CDCTRL1 data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_711 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_711(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_711(15 DOWNTO 0);
        END IF;
      WHEN "0000001111010010" =>
        -- CDCTRL1 data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_712 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_712(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_712(15 DOWNTO 0);
        END IF;
      WHEN "0000001111010011" =>
        -- CDCTRL1 data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_713 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_713(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_713(15 DOWNTO 0);
        END IF;
      WHEN "0000001111010100" =>
        -- CDCTRL1 data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_714 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_714(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_714(15 DOWNTO 0);
        END IF;
      WHEN "0000001111010101" =>
        -- CDCTRL1 data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_715 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_715(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_715(15 DOWNTO 0);
        END IF;
      WHEN "0000001111010110" =>
        -- CDCTRL1 data, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_716 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_716(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_716(15 DOWNTO 0);
        END IF;
      WHEN "0000001111010111" =>
        -- CDCTRL1 data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_717 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_717(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_717(15 DOWNTO 0);
        END IF;
      WHEN "0000001111011000" =>
        -- CDCTRL1 data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_718 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_718(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_718(15 DOWNTO 0);
        END IF;
      WHEN "0000001111011001" =>
        -- CDCTRL1 data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_719 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_719(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_719(15 DOWNTO 0);
        END IF;
      WHEN "0000001111011010" =>
        -- CDCTRL1 data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_720 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_720(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_720(15 DOWNTO 0);
        END IF;
      WHEN "0000001111011011" =>
        -- CDCTRL1 data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_721 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_721(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_721(15 DOWNTO 0);
        END IF;
      WHEN "0000001111011100" =>
        -- CDCTRL1 data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_722 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_722(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_722(15 DOWNTO 0);
        END IF;
      WHEN "0000001111011101" =>
        -- CDCTRL1 data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_723 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_723(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_723(15 DOWNTO 0);
        END IF;
      WHEN "0000001111011110" =>
        -- CDCTRL1 data, 0th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_724 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_724(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_724(15 DOWNTO 0);
        END IF;
      WHEN "0000001111011111" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_725 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_725(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_725(15 DOWNTO 0);
        END IF;
      WHEN "0000001111100000" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_726 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_726(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_726(15 DOWNTO 0);
        END IF;
        -- ---------------- EDCR (address = 0x1D, value = 0x6011) ----------------------  
      WHEN "0000001111100001" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_727 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_727(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_727(15 DOWNTO 0);
        END IF;
      WHEN "0000001111100010" =>
        -- Start frame, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_728 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_728(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_728(15 DOWNTO 0);
        END IF;
      WHEN "0000001111100011" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_729 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_729(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_729(15 DOWNTO 0);
        END IF;
      WHEN "0000001111100100" =>
        -- Start frame, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_730 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_730(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_730(15 DOWNTO 0);
        END IF;
      WHEN "0000001111100101" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_731 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_731(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_731(15 DOWNTO 0);
        END IF;
      WHEN "0000001111100110" =>
        -- Operation write code, first bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_732 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_732(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_732(15 DOWNTO 0);
        END IF;
      WHEN "0000001111100111" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_733 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_733(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_733(15 DOWNTO 0);
        END IF;
      WHEN "0000001111101000" =>
        -- Operation write code, second bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_734 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_734(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_734(15 DOWNTO 0);
        END IF;
      WHEN "0000001111101001" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_735 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_735(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_735(15 DOWNTO 0);
        END IF;
      WHEN "0000001111101010" =>
        -- Phy address, 4th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_736 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_736(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_736(15 DOWNTO 0);
        END IF;
      WHEN "0000001111101011" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_737 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_737(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_737(15 DOWNTO 0);
        END IF;
      WHEN "0000001111101100" =>
        -- Phy address, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_738 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_738(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_738(15 DOWNTO 0);
        END IF;
      WHEN "0000001111101101" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_739 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_739(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_739(15 DOWNTO 0);
        END IF;
      WHEN "0000001111101110" =>
        -- Phy address, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_740 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_740(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_740(15 DOWNTO 0);
        END IF;
      WHEN "0000001111101111" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_741 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_741(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_741(15 DOWNTO 0);
        END IF;
      WHEN "0000001111110000" =>
        -- Phy address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_742 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_742(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_742(15 DOWNTO 0);
        END IF;
      WHEN "0000001111110001" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_743 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_743(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_743(15 DOWNTO 0);
        END IF;
      WHEN "0000001111110010" =>
        -- Phy address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_744 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_744(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_744(15 DOWNTO 0);
        END IF;
      WHEN "0000001111110011" =>
        -- EDCR address (0x1D), 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_745 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_745(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_745(15 DOWNTO 0);
        END IF;
      WHEN "0000001111110100" =>
        -- EDCR address, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_746 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_746(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_746(15 DOWNTO 0);
        END IF;
      WHEN "0000001111110101" =>
        -- EDCR address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_747 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_747(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_747(15 DOWNTO 0);
        END IF;
      WHEN "0000001111110110" =>
        -- EDCR address, 3rd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_748 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_748(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_748(15 DOWNTO 0);
        END IF;
      WHEN "0000001111110111" =>
        -- EDCR address, 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_749 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_749(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_749(15 DOWNTO 0);
        END IF;
      WHEN "0000001111111000" =>
        -- EDCR address, 2nd bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_750 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_750(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_750(15 DOWNTO 0);
        END IF;
      WHEN "0000001111111001" =>
        -- EDCR address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_751 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_751(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_751(15 DOWNTO 0);
        END IF;
      WHEN "0000001111111010" =>
        -- EDCR address, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_752 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_752(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_752(15 DOWNTO 0);
        END IF;
      WHEN "0000001111111011" =>
        -- EDCR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_753 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_753(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_753(15 DOWNTO 0);
        END IF;
      WHEN "0000001111111100" =>
        -- EDCR address, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_754 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_754(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_754(15 DOWNTO 0);
        END IF;
      WHEN "0000001111111101" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_755 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_755(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_755(15 DOWNTO 0);
        END IF;
      WHEN "0000001111111110" =>
        -- Turnaround, most significant bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_756 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_756(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_756(15 DOWNTO 0);
        END IF;
      WHEN "0000001111111111" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_757 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_757(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_757(15 DOWNTO 0);
        END IF;
      WHEN "0000010000000000" =>
        -- Turnaround, least significant bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_758 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_758(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_758(15 DOWNTO 0);
        END IF;
      WHEN "0000010000000001" =>
        -- EDCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_759 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_759(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_759(15 DOWNTO 0);
        END IF;
      WHEN "0000010000000010" =>
        -- EDCR data, 15th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_760 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_760(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_760(15 DOWNTO 0);
        END IF;
      WHEN "0000010000000011" =>
        -- EDCR data, 14th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_761 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_761(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_761(15 DOWNTO 0);
        END IF;
      WHEN "0000010000000100" =>
        -- EDCR data, 14th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_762 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_762(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_762(15 DOWNTO 0);
        END IF;
      WHEN "0000010000000101" =>
        -- EDCR data, 13th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_763 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_763(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_763(15 DOWNTO 0);
        END IF;
      WHEN "0000010000000110" =>
        -- EDCR data, 13th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_764 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_764(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_764(15 DOWNTO 0);
        END IF;
      WHEN "0000010000000111" =>
        -- EDCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_765 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_765(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_765(15 DOWNTO 0);
        END IF;
      WHEN "0000010000001000" =>
        -- EDCR data, 12th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_766 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_766(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_766(15 DOWNTO 0);
        END IF;
      WHEN "0000010000001001" =>
        -- EDCR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_767 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_767(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_767(15 DOWNTO 0);
        END IF;
      WHEN "0000010000001010" =>
        -- EDCR data, 11th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_768 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_768(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_768(15 DOWNTO 0);
        END IF;
      WHEN "0000010000001011" =>
        -- EDCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_769 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_769(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_769(15 DOWNTO 0);
        END IF;
      WHEN "0000010000001100" =>
        -- EDCR data, 10th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_770 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_770(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_770(15 DOWNTO 0);
        END IF;
      WHEN "0000010000001101" =>
        -- EDCR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_771 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_771(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_771(15 DOWNTO 0);
        END IF;
      WHEN "0000010000001110" =>
        -- EDCR data, 9th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_772 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_772(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_772(15 DOWNTO 0);
        END IF;
      WHEN "0000010000001111" =>
        -- EDCR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_773 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_773(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_773(15 DOWNTO 0);
        END IF;
      WHEN "0000010000010000" =>
        -- EDCR data, 8th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_774 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_774(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_774(15 DOWNTO 0);
        END IF;
      WHEN "0000010000010001" =>
        -- EDCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_775 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_775(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_775(15 DOWNTO 0);
        END IF;
      WHEN "0000010000010010" =>
        -- EDCR data, 7th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_776 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_776(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_776(15 DOWNTO 0);
        END IF;
      WHEN "0000010000010011" =>
        -- EDCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_777 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_777(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_777(15 DOWNTO 0);
        END IF;
      WHEN "0000010000010100" =>
        -- EDCR data, 6th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_778 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_778(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_778(15 DOWNTO 0);
        END IF;
      WHEN "0000010000010101" =>
        -- EDCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_779 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_779(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_779(15 DOWNTO 0);
        END IF;
      WHEN "0000010000010110" =>
        -- EDCR data, 5th bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_780 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_780(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_780(15 DOWNTO 0);
        END IF;
      WHEN "0000010000010111" =>
        -- EDCR data, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_781 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_781(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_781(15 DOWNTO 0);
        END IF;
      WHEN "0000010000011000" =>
        -- EDCR data, 4th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_782 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_782(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_782(15 DOWNTO 0);
        END IF;
      WHEN "0000010000011001" =>
        -- EDCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_783 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_783(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_783(15 DOWNTO 0);
        END IF;
      WHEN "0000010000011010" =>
        -- EDCR data, 3rd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_784 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_784(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_784(15 DOWNTO 0);
        END IF;
      WHEN "0000010000011011" =>
        -- EDCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_785 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_785(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_785(15 DOWNTO 0);
        END IF;
      WHEN "0000010000011100" =>
        -- EDCR data, 2nd bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_786 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_786(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_786(15 DOWNTO 0);
        END IF;
      WHEN "0000010000011101" =>
        -- EDCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_787 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_787(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_787(15 DOWNTO 0);
        END IF;
      WHEN "0000010000011110" =>
        -- EDCR data, 1st bit = 0
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '0';
        done <= '0';
        add_temp_788 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_788(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_788(15 DOWNTO 0);
        END IF;
      WHEN "0000010000011111" =>
        -- EDCR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '0';
        done <= '0';
        add_temp_789 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_789(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_789(15 DOWNTO 0);
        END IF;
      WHEN "0000010000100000" =>
        -- EDCR data, 0th bit = 1
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_790 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_790(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_790(15 DOWNTO 0);
        END IF;
      WHEN "0000010000100001" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '1';
        mdio <= '1';
        done <= '0';
        add_temp_791 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_791(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_791(15 DOWNTO 0);
        END IF;
      WHEN "0000010000100010" =>
        -- Pause between frames for one cycle of MDC
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '0';
        add_temp_792 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
        IF add_temp_792(16) /= '0' THEN 
          clk_cnt_out_tmp <= X"FFFF";
        ELSE 
          clk_cnt_out_tmp <= add_temp_792(15 DOWNTO 0);
        END IF;
      WHEN OTHERS => 
        eth_reset_n <= '1';
        mdc <= '0';
        mdio <= '1';
        done <= '1';
        clk_cnt_out_tmp <= clk_cnt_in_unsigned;
    END CASE;
    IF guard3 = '1' THEN 
      -- Initial media clock synchronization for 32 cycles
      eth_reset_n <= '1';
      cast := signed(resize(clk_cnt_in_unsigned, 32));
      cast_0 := cast AND to_signed(16#00000001#, 32);
      cast_1 := unsigned(cast_0(15 DOWNTO 0));
      IF cast_1 /= to_unsigned(16#00000000#, 16) THEN 
        mdc <= '1';
      ELSE 
        mdc <= '0';
      END IF;
      mdio <= '1';
      done <= '0';
      add_temp_793 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
      IF add_temp_793(16) /= '0' THEN 
        clk_cnt_out_tmp <= X"FFFF";
      ELSE 
        clk_cnt_out_tmp <= add_temp_793(15 DOWNTO 0);
      END IF;
    END IF;
    IF guard2 = '1' THEN 
      -- Waiting after reset
      eth_reset_n <= '1';
      mdc <= '0';
      mdio <= '1';
      done <= '0';
      add_temp_794 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
      IF add_temp_794(16) /= '0' THEN 
        clk_cnt_out_tmp <= X"FFFF";
      ELSE 
        clk_cnt_out_tmp <= add_temp_794(15 DOWNTO 0);
      END IF;
    END IF;
    IF guard1 = '1' THEN 
      -- Reset
      eth_reset_n <= '0';
      mdc <= '0';
      mdio <= '1';
      done <= '0';
      add_temp_795 := resize(clk_cnt_in_unsigned, 17) + to_unsigned(16#00001#, 17);
      IF add_temp_795(16) /= '0' THEN 
        clk_cnt_out_tmp <= X"FFFF";
      ELSE 
        clk_cnt_out_tmp <= add_temp_795(15 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Initialization_1_output;


  clk_cnt_out <= std_logic_vector(clk_cnt_out_tmp);

END rtl;

